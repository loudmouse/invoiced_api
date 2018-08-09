# frozen_string_literal: true

require 'test_helper'

module V1
  class ContactsControllerTest < ActionDispatch::IntegrationTest
    test 'should get only contacts for loudmouse' do
      account = accounts(:loudmouse)

      not_loudmouse_contact = contacts(:two)

      get v1_contacts_path(account_id: account.id)

      contacts = JSON.parse(@response.body)['data']
      contact_ids = contacts.map { |contact| contact['id']}

      assert_response :success
      assert_not_includes contact_ids, not_loudmouse_contact.id

    end
  end
end
