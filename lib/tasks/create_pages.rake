desc "Creates Default Pages"
task :create_pages => :environment do
  pages_path = Rails.root.to_s + "/lib/assets/pages"

  # make sure that identifer <name> is same as assets/pages/<name>.html
  pages_info =
    [
     { :identifier => "accommodations",     :title => "Accommodations"     },
     { :identifier => "around_alberta",     :title => "Around Alberta"     },
     { :identifier => "arts",               :title => "Arts Festival"      },
     { :identifier => "call_for_papers",    :title => "Call for Papers"    },
     { :identifier => "contact_us",         :title => "Contact Us"         },
     { :identifier => "home",               :title => "Home"               },
     { :identifier => "programme",          :title => "Programme"          },
     { :identifier => "travel_alberta",     :title => "Travel Alberta"     },
     { :identifier => "travel_information", :title => "Travel Information" }
    ]

  pages_info.each do |info|
    content = File.read(pages_path + "/" + info[:identifier] + ".html")
    params = info.merge(:content => content)
    Page.create!(params)
  end
end
