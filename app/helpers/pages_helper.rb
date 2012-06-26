module PagesHelper
  def default_pages_links
    default_pages = {
      "HOME"               => "home",
      "CALL FOR PAPERS"    => "call_for_papers",
      "REGISTRATION"       => "registration",
      "ACCOMMODATION"      => "accommodations",
      "TRAVEL INFORMATION" => "travel_information",
      "PROGRAMME"          => "programme",
      "ARTS FESTIVAL"      => "arts",
      "AROUND EDMONTON"    => "around_edmonton",
      "TRAVEL ALBERTA"     => "travel_alberta",
      "CONTACT US"         => "contact_us"
    }

    pages = Page.where(:identifier => default_pages.values).select([:id, :identifier]).all
    default_pages.collect do |title, identifier|
      page = pages.detect { |c| c.identifier == identifier }
      link_to title, page_path(page)
    end
  end
end
