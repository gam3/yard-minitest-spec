
# This class handles define statements
class YardMiniTestSpecDescribeHandler < YARD::Handlers::Ruby::Base
  handles method_call(:describe)
  
  # process the define statement
  def process
    meth = statement.method_name(true).to_s

    name = statement.parameters.first.jump(:string_content).source
    (namespace[:mtsdh] ||= []).push name
    parse_block(statement.last.last, owner: namespace)
    namespace[:mtsdh].pop
    nil
  rescue YARD::Handlers::Ruby::NamespaceMissingError
  end
end

# This class handles it statements
class YardMiniTestSpecItHandler < YARD::Handlers::Ruby::Base
  handles method_call(:it)
  
  # process the it statement
  def process
    array = owner[:mtsdh].dup

    return nil unless array
    if array.size > 1
      last = array.pop
      start = array.join('::')
      if last.match(/\A[A-Z]/)
        name = start + '::' + last
      else
        name = start + last
      end
    else
      name = array[0]
    end

    if name.match(/:[a-z]([^:]*)/)
      name.gsub!(/:([a-z][^:]*)/, '.\1')
    end
    if obj = YARD::Registry.resolve(namespace, name)
      # ignore :it with empty body
      if statement.last.last.source.chomp.size > 0
        (obj[:specifications] ||= []) << {
          name: statement.parameters.first.jump(:string_content).source,
          file: statement.file,
          line: statement.line,
          source: statement.last.last.source.chomp
        }
      end
    else
      if namespace.root?
        text = "Nothing to describe for #{name}"
      else
        text = "Nothing to describe for #{name} in (#{namespace})"
      end
      log.warn text unless namespace[:duplicate] and namespace[:duplicate][name]
      ( namespace[:duplicate] ||= {} )[name] = true 
    end
    nil
  end
end
