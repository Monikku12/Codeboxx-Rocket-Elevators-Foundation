require "application_system_test_case"

class DimCustomersTest < ApplicationSystemTestCase
  setup do
    @dim_customer = dim_customers(:one)
  end

  test "visiting the index" do
    visit dim_customers_url
    assert_selector "h1", text: "Dim Customers"
  end

  test "creating a Dim customer" do
    visit dim_customers_url
    click_on "New Dim Customer"

    fill_in "Nb elevator", with: @dim_customer.Nb_Elevator
    fill_in "Company contact email", with: @dim_customer.company_contact_email
    fill_in "Company name", with: @dim_customer.company_name
    fill_in "Creation date", with: @dim_customer.creation_date
    fill_in "Customer city", with: @dim_customer.customer_city
    fill_in "Full name", with: @dim_customer.full_name
    click_on "Create Dim customer"

    assert_text "Dim customer was successfully created"
    click_on "Back"
  end

  test "updating a Dim customer" do
    visit dim_customers_url
    click_on "Edit", match: :first

    fill_in "Nb elevator", with: @dim_customer.Nb_Elevator
    fill_in "Company contact email", with: @dim_customer.company_contact_email
    fill_in "Company name", with: @dim_customer.company_name
    fill_in "Creation date", with: @dim_customer.creation_date
    fill_in "Customer city", with: @dim_customer.customer_city
    fill_in "Full name", with: @dim_customer.full_name
    click_on "Update Dim customer"

    assert_text "Dim customer was successfully updated"
    click_on "Back"
  end

  test "destroying a Dim customer" do
    visit dim_customers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dim customer was successfully destroyed"
  end
end
