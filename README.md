yard-minitest-spec
==================

YARD helper to parse Minitest::Spec files

--

  yardoc --plugin minitest-spec lib spec 

If you would like to have this plugin loaded by default add the lines below to your _~/.yard/config_ file.

    #load_plugins: true # Auto-load plugins when YARD starts
    autoload_plugins:
      - yard-minitest-spec

---

This gem should be signed. See https://www.rubygems-openpgp-ca.org/ for more information
