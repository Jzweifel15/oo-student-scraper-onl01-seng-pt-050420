require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)

    doc = Nokogiri::HTML(open(index_url))

    student_index_array = []

    doc.css(".student-card").each do |student|
      student_index_array.push({
        location: student.css("p.student-location").text,
        name: student.css("h4.student-name").text,
        profile_url: "https://learn-co-curriculum.github...://learn-co-curriculum.github.io/student-scraper-test-page/students/students/#{student.css("a").attribute("href").value}"})
    end
    student_index_array
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

