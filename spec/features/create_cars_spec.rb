require 'rails_helper'

RSpec.feature "CreateCars", type: :feature do
    context 'Creating a car' do
        Steps 'Being Welcomed' do
            Given 'I am on the landing page' do
                  visit '/cars/create'
            end
            Then 'I can see a welcome message' do
                  expect(page).to have_content("Welcome to the Car Simulator")
            end
        end
        Steps 'Creating a car' do
            When 'I fill in the car make and model year' do
                visit '/cars/create'
                fill_in 'make', with: 'Honda'
                fill_in 'modelyear', with: '2007'
            end
            Then 'I can submit the information' do
                click_button 'Create'
            end
            Then "I can see the car's info" do
                expect(page).to have_content('Make: Honda')
                expect(page).to have_content('Modelyear: 2007')
            end
            And 'I can see the speed of the car' do
                expect(page).to have_content('Speed: 0')
            end
            When "I click the accelerate button with the parking brake on" do
                click_button 'Accelerate'
            end
            Then 'I cannot increase the speed' do
                expect(page).to have_content('Speed: 0')
            end
            When 'I release the parking brake' do
                choose('off')
                click_button "Set Parking Brake"
                expect(page).to have_content('Parking Brake: off')
            end
            Then 'I can click the accelerate button to increase speed by 10' do
                click_button 'Accelerate'
                expect(page).to have_content('Speed: 10')
            end
        end
    end
end
