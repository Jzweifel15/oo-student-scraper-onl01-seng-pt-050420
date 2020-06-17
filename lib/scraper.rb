require 'open-uri'
require 'pry'

class Scraper
  
  def self.scrape_index_page(index_url)
    page = Nokogiri::HTML(open(index_url))
    students = []
    page.css("div.roster-cards-container").each do |card|
      card.css(".student-card a"). each do |student|
        profile = "./fixtures/student-site/#{student.attr("href")}"
        name = student.css(".student-name").text
        location = student.css(".student-location").text
        students << {profile_url: profile, name: name, location: location}
      end
    end
    students
  end
  
=begin
  def self.scrape_index_page(index_url)

    doc = Nokogiri::HTML(open(index_url))

    student_index_array = []

    doc.css(".student-card").map do |student|
      student_name = student.css("h4.student-name").text
      student_location = student.css("p.student-location").text
      student_profile_url = "https://learn-co-cirriculum.github.io/student-scraper-test-page/students/#{student.css("a").attribute("href").value}"
      student_index_array.push({name: student_name, location: student_location, profile_url: student_profile_url})
    end 
    student_index_array 
  end 
=end
  def self.scrape_profile_page(profile_url)

    doc = Nokogiri::HTML(open(profile_url))
    student = Hash.new


    social_icons = doc.css("div.social-icon-container a").collect {|x| x.attribute("href").value}
    social_icons.each do |social_icon|
      if social_icon.include?("linkedin")
        student[:linkedin] = social_icon
      elsif social_icon.include?("github")
        student[:github] = social_icon
      elsif social_icon.include?("twitter")
        student[:twitter] = social_icon
      else
        student[:blog] = social_icon
      end
    end
    # if doc.css("div.bio-content.content-holder div.description-holder p")
      student[:bio] = doc.css("div.bio-content.content-holder div.description-holder p").text
    # end
    # if doc.css(".profile-quote")
      student[:profile_quote] = doc.css(".profile-quote").text
    # end
    student
  end

end 

