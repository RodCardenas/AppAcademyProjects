require 'rspec'
require 'movie_sql'

describe "#rain_man_cast" do
  it "1. List 'Rain Man' cast by name" do
    expect(rain_man_cast).to eq([
      {"name"=>"Barry Levinson"},
      {"name"=>"Bonnie Hunt"},
      {"name"=>"Dustin Hoffman"},
      {"name"=>"Jack Murdock"},
      {"name"=>"Jerry Molen"},
      {"name"=>"Lucinda Jenney"},
      {"name"=>"Michael D. Roberts"},
      {"name"=>"Tom Cruise"},
      {"name"=>"Valeria Golino"}
    ])
  end
end

describe "#harrison_ford_films" do
  it "2. List Harrison Ford films by movie title" do
    expect(harrison_ford_films).to eq([
      { "title" => "A Hundred and One Nights" },
      { "title" => "American Graffiti" },
      { "title" => "Apocalypse Now" },
      { "title" => "Dead Heat on a Merry-Go-Round" },
      { "title" => "Extraordinary Measures" },
      { "title" => "Firewall" },
      { "title" => "Force 10 From Navarone" },
      { "title" => "Hawthorne of the U.S.A." },
      { "title" => "Hollywood Homicide" },
      { "title" => "Indiana Jones and the Last Crusade" },
      { "title" => "Jimmy Hollywood" },
      { "title" => "More American Graffiti" },
      { "title" => "Morning Glory" },
      { "title" => "Presumed Innocent" },
      { "title" => "Regarding Henry" },
      { "title" => "Sabrina" },
      { "title" => "Sally of the Sawdust" },
      { "title" => "Shadows" },
      { "title" => "Six Days Seven Nights" },
      { "title" => "Smilin' Through" },
      { "title" => "Star Wars Episode IV: A New Hope" },
      { "title" => "Star Wars Episode V: The Empire Strikes Back" },
      { "title" => "Star Wars Episode VI: Return of the Jedi" },
      { "title" => "The Conversation" },
      { "title" => "The Devil's Own" },
      { "title" => "The Fugitive" },
      { "title" => "The Star Wars Holiday Special" },
      { "title" => "What Lies Beneath" },
      { "title" => "Witness" }
    ])
  end
end

describe "#matt_damon_supporting_actor_films" do
  it "3. List Matt Damon supporting actor films by title" do
    expect(matt_damon_supporting_actor_films).to eq([
      {"title"=>"Che"},
      {"title"=>"Contagion"},
      {"title"=>"Courage Under Fire"},
      {"title"=>"EuroTrip"},
      {"title"=>"Finding Forrester"},
      {"title"=>"Jersey Girl"},
      {"title"=>"Margaret"},
      {"title"=>"Saving Private Ryan"},
      {"title"=>"The Good Mother"},
      {"title"=>"The Legend of Bagger Vance"},
      {"title"=>"The Majestic"},
      {"title"=>"True Grit"}
    ])
  end
end

describe "#leading_star_for_1962_films" do
  it "4. List 1962 leading stars by movie title" do
    expect(leading_star_for_1962_films).to eq([
      { "title" => "A Kind of Loving", "name" => "Alan Bates" },
      { "title" => "Barabbas", "name" => "Anthony Quinn" },
      { "title" => "Big and Little Wong Tin Bar", "name" => "Jackie Chan" },
      { "title" => "Billy Rose's Jumbo", "name" => "Doris Day" },
      { "title" => "Boys' Night Out", "name" => "Kim Novak" },
      { "title" => "Cape Fear", "name" => "Gregory Peck" },
      { "title" => "Carry On Cruising", "name" => "Sid James" },
      { "title" => "Days of Wine and Roses", "name" => "Jack Lemmon" },
      { "title" => "Gay Purr-ee", "name" => "Judy Garland" },
      { "title" => "Gypsy", "name" => "Rosalind Russell" },
      { "title" => "In Search of the Castaways", "name" => "Hayley Mills" },
      { "title" => "Jigsaw", "name" => "Jack Warner" },
      { "title" => "L'Eclisse", "name" => "Alain Delon" },
      { "title" => "La notte", "name" => "Marcello Mastroianni" },
      { "title" => "Life for Ruth", "name" => "Michael Craig" },
      { "title" => "Lolita", "name" => "James Mason" },
      { "title" => "Long Day's Journey into Night", "name" => "Katharine Hepburn" },
      { "title" => "Love at Twenty", "name" => "Jean-Pierre Léaud" },
      { "title" => "Lycanthropus", "name" => "Barbara Lass" },
      { "title" => "Mother Joan of the Angels", "name" => "Lucyna Winnicka" },
      { "title" => "Mutiny on the Bounty", "name" => "Marlon Brando" },
      { "title" => "Panic in Year Zero!", "name" => "Ray Milland" },
      { "title" => "Period of Adjustment", "name" => "Anthony Franciosa" },
      { "title" => "Pressure Point", "name" => "Bobby Darin" },
      { "title" => "Ride the High Country", "name" => "Randolph Scott" },
      { "title" => "State Fair", "name" => "Pat Boone" },
      { "title" => "Sundays and Cybele", "name" => "Hardy Krüger" },
      { "title" => "Term of Trial", "name" => "Laurence Olivier" },
      { "title" => "That Touch of Mink", "name" => "Cary Grant" },
      { "title" => "The 300 Spartans", "name" => "King Leonidas" },
      { "title" => "The Apartment", "name" => "Jack Lemmon" },
      { "title" => "The Counterfeit Traitor", "name" => "William Holden" },
      { "title" => "The Manchurian Candidate", "name" => "Frank Sinatra" },
      { "title" => "The Music Man", "name" => "Robert Preston" },
      { "title" => "The Phantom of the Opera", "name" => "Herbert Lom" },
      { "title" => "The Trial", "name" => "Anthony Perkins" },
      { "title" => "Through a Glass Darkly", "name" => "Harriet Andersson" },
      { "title" => "To Kill a Mockingbird", "name" => "Mary Badham" },
      { "title"=>"Village of Daughters", "name"=>"Yvonne Romain"},
      { "title" => "What Ever Happened to Baby Jane?", "name" => "Joan Crawford" },
      { "title" => "Who's Got the Action?", "name" => "Dean Martin" }
    ])
  end
end

describe "#no_casting_info" do
  it "5. Give the movie from 1920 with no casting information" do
    expect(no_casting_info).to eq([
      {"title"=>"The Mark of Zorro"}
    ])
  end
end

describe "#big_movie_stars" do
  it "6. List movies having > 60 roles" do
    expect(big_movies).to eq([
      {"title"=>"A Hundred and One Nights", "roles"=>70},
      {"title"=>"Perfect", "roles"=>78},
      {"title"=>"S.W.A.T.", "roles"=>68}
    ])
  end
end

describe "#will_smith_supporting_actors" do
  it "7. List the supporting actor for all Will Smith films" do
    expect(will_smith_supporting_actors).to eq([
      {"yr"=>2007, "title"=>"I Am Legend", "name"=>"Alice Braga"},
      {"yr"=>2004, "title"=>"i, Robot", "name"=>"Bridget Moynahan"},
      {"yr"=>2005, "title"=>"Hitch", "name"=>"Eva Mendes"},
      {"yr"=>1999, "title"=>"Enemy of the State", "name"=>"Gene Hackman"},
      {"yr"=>2004, "title"=>"Shark Tale", "name"=>"Jack Black"},
      {"yr"=>2006, "title"=>"The Pursuit of Happiness", "name"=>"Jaden Smith"},
      {"yr"=>2000, "title"=>"The Legend of Bagger Vance", "name"=>"Matt Damon"}
    ])
  end
end

describe "#busiest_john_travolta_years" do
  it "8. List years in which John Travolta made >2 films" do
    expect(busiest_john_travolta_years).to eq([
      { "yr" => 1998, "count" => 3 }
    ])
  end
end

