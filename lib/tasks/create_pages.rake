desc "Creates Default Pages"
task :create_pages => :environment do
  pages_path = Rails.root.to_s + "/lib/assets/pages"

  # make sure that identifer <name> is same as assets/pages/<name>.html
  pages_info =
    [
     { :identifier => "accommodations",     :title => "Accommodations"     },
     { :identifier => "around_edmonton",    :title => "Around Edmonton"    },
     { :identifier => "arts",               :title => "Arts Festival"      },
     { :identifier => "call_for_papers",    :title => "Call for Papers"    },
     { :identifier => "contact_us",         :title => "Contact Us"         },
     { :identifier => "home",               :title => "Home"               },
     { :identifier => "programme",          :title => "Programme"          },
     { :identifier => "registration",       :title => "Registration"       },
     { :identifier => "travel_alberta",     :title => "Travel Alberta"     },
     { :identifier => "travel_information", :title => "Travel Information" }
    ]

  pages_info.each do |info|
    content = File.read(pages_path + "/" + info[:identifier] + ".html")
    params = info.merge(:content => content)

    page = Page.find_by_identifier(params[:identifier])
    page.destroy if page
    Page.create!(params)
  end
end
