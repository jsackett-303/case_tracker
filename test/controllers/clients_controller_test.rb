require 'test_helper'

class ClientsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @client = clients(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get clients_url
    assert_response :success
  end

  test "should get new" do
    get new_client_url
    assert_response :success
  end

  test "should create client" do
    assert_difference('Client.count') do
      post clients_url, params: { client: { ac: @client.ac, alj: @client.alj, apartment: @client.apartment, appeal: @client.appeal, appeal_filed: @client.appeal_filed, awarded_at: @client.awarded_at, case_id: @client.case_id, city: @client.city, claimant_hearing_prep: @client.claimant_hearing_prep, close_out_letter: @client.close_out_letter, cost_three: @client.cost_three, cost_two: @client.cost_two, costs: @client.costs, date_costs_received: @client.date_costs_received, date_of_birth: @client.date_of_birth, date_scheduled: @client.date_scheduled, date_ssdi_received: @client.date_ssdi_received, date_ssi_received: @client.date_ssi_received, decision: @client.decision, decision_date: @client.decision_date, dli: @client.dli, dlw: @client.dlw, email: @client.email, expedited: @client.expedited, first_contact: @client.first_contact, first_name: @client.first_name, fr_requested: @client.fr_requested, fr_sub: @client.fr_sub, hearing_date: @client.hearing_date, initial_appearance: @client.initial_appearance, initial_denial: @client.initial_denial, initial_to_local: @client.initial_to_local, last_name: @client.last_name, local: @client.local, me: @client.me, notice_of_hearing: @client.notice_of_hearing, oadr: @client.oadr, open: @client.open, packet_sent: @client.packet_sent, phone1: @client.phone1, phone2: @client.phone2, prefix: @client.prefix, proposed_exhibits: @client.proposed_exhibits, ready_to_schedule: @client.ready_to_schedule, recon_denial: @client.recon_denial, recon_filed: @client.recon_filed, rfh_acked: @client.rfh_acked, rfh_filed: @client.rfh_filed, sign_up_date: @client.sign_up_date, sixteen_ninety_six_to_oadr: @client.sixteen_ninety_six_to_oadr, state: @client.state, street: @client.street, supplemental_date: @client.supplemental_date, local_type: @client.local_type, ve: @client.ve, verfication_of_local: @client.verfication_of_local, verification_of_oadr: @client.verification_of_oadr, zip_code: @client.zip_code } }
    end

    assert_redirected_to client_url(Client.last)
  end

  test "should show client" do
    get client_url(@client)
    assert_response :success
  end

  test "should get edit" do
    get edit_client_url(@client)
    assert_response :success
  end

  test "should update client" do
    patch client_url(@client), params: { client: { ac: @client.ac, alj: @client.alj, apartment: @client.apartment, appeal: @client.appeal, appeal_filed: @client.appeal_filed, awarded_at: @client.awarded_at, case_id: @client.case_id, city: @client.city, claimant_hearing_prep: @client.claimant_hearing_prep, close_out_letter: @client.close_out_letter, cost_three: @client.cost_three, cost_two: @client.cost_two, costs: @client.costs, date_costs_received: @client.date_costs_received, date_of_birth: @client.date_of_birth, date_scheduled: @client.date_scheduled, date_ssdi_received: @client.date_ssdi_received, date_ssi_received: @client.date_ssi_received, decision: @client.decision, decision_date: @client.decision_date, dli: @client.dli, dlw: @client.dlw, email: @client.email, expedited: @client.expedited, first_contact: @client.first_contact, first_name: @client.first_name, fr_requested: @client.fr_requested, fr_sub: @client.fr_sub, hearing_date: @client.hearing_date, initial_appearance: @client.initial_appearance, initial_denial: @client.initial_denial, initial_to_local: @client.initial_to_local, last_name: @client.last_name, local: @client.local, me: @client.me, notice_of_hearing: @client.notice_of_hearing, oadr: @client.oadr, open: @client.open, packet_sent: @client.packet_sent, phone1: @client.phone1, phone2: @client.phone2, prefix: @client.prefix, proposed_exhibits: @client.proposed_exhibits, ready_to_schedule: @client.ready_to_schedule, recon_denial: @client.recon_denial, recon_filed: @client.recon_filed, rfh_acked: @client.rfh_acked, rfh_filed: @client.rfh_filed, sign_up_date: @client.sign_up_date, sixteen_ninety_six_to_oadr: @client.sixteen_ninety_six_to_oadr, state: @client.state, street: @client.street, supplemental_date: @client.supplemental_date, local_type: @client.local_type, ve: @client.ve, verfication_of_local: @client.verfication_of_local, verification_of_oadr: @client.verification_of_oadr, zip_code: @client.zip_code } }
    assert_redirected_to client_url(@client)
  end

  test "should destroy client" do
    assert_difference('Client.count', -1) do
      delete client_url(@client)
    end

    assert_redirected_to clients_url
  end
end
