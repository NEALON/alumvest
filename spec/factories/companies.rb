FactoryGirl.define do
  factory :category, :class => Alumvest::Category::Base do
    name 'Science and Technology'
  end
end

FactoryGirl.define do
  factory :company, :class => Alumvest::Company::Base do
    company_name          'BionicEyez'
    logo_url              'https://www.filepicker.io/api/file/PJWqNjCRSynIP9SYSDo4'
    short_description     'Eyeglasses that show messages to the user: emails, news, scores, directions, heartbeats...'
    company_url           'http://bioniceyez.com/'
    campaign_title        'BionicEyez See More'
    company_highlights    %Q{
                            <p style='margin: 1em; padding-right: 3em'>We started the feasibility study in the fall of 2011, the development of the optical system in the spring of 2012, and the development of the hardware and software in the fall of 2012. Our streamlined product vision allowed us to prototype and develop quickly through rapid iterations.</p>
                            <p style='margin: 1em; padding-right: 3em'>We have now arrived at the first prototype with our own work and money, which was the plan, and that’s where we have to stop and we need you!</p>
                          }
    company_details       %Q{
                            <p style='margin: 1em; padding-right: 3em'>
                               BionicEyez displays to the user any kind of message, super-imposed on reality. It keeps you up to date, without you
                               having to check your smartphone continuously.
                            </p>
                            <p style='margin: 1em; padding-right: 3em'>
                               Information is sent from your smartphone to your BionicEyez via a Bluetooth connection. The types of content and
                               data transferred to BionicEyez are determined by the apps you choose to download.
                            </p>
                            <p style='margin: 1em; padding-right: 3em'>
                               Compared to our competitors, our eyeglasses are more focused on reporting information, in a very utilitarian
                               approach:
                            </p>
                            <ul>
                               <li>The standard BionicEyez is "receive only", it's not made to share photos
                               <li>The projection is monochrome (green)
                               <li>The battery lasts longer, a full day
                               <li>BionicEyez projects the information close to the center of vision, with less strain to the eye of the wearer
                            </ul>
                          }
    founded_on_year       5.years.ago.year
    ownership_structure   'Corporation'
    category_id           (Alumvest::Category::Base.first.try(:id) || FactoryGirl.create(:category).id)
    address_1             Faker::Address.street_address
    address_2             Faker::Address.secondary_address
    city                  Faker::Address.city
    state                 Faker::Address.state_abbr
    zip                   Faker::Address.zip_code
    phone                 Faker::PhoneNumber.phone_number
    faq                   "FAQ #{Faker::Lorem.sentence(10)} #{Faker::Lorem.sentence(10)} #{Faker::Lorem.sentence(10)}"
    video_url             'https://www.youtube.com/embed/elXk87IKgCo'
    photo_url             'https://www.filepicker.io/api/file/7MOvKMRQ5eX9boDoX6gx'
    banner_photo_url      'http://placehold.it/1500x400'
  end
end
