class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :last_name
      t.string :first_name
      t.string :prefix
      t.string :street
      t.string :apartment
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :phone1
      t.string :phone2
      t.string :email
      t.date :date_of_birth
      t.string :local_type
      t.date :dlw
      t.date :dli
      t.date :first_contact
      t.date :packet_sent
      t.date :sign_up_date
      t.date :initial_to_local
      t.date :verfication_of_local
      t.date :sixteen_ninety_six_to_oadr
      t.date :verification_of_oadr
      t.string :local
      t.string :oadr
      t.date :initial_appearance
      t.date :initial_denial
      t.date :recon_filed
      t.date :recon_denial
      t.date :fr_requested
      t.date :fr_sub
      t.date :rfh_filed
      t.date :rfh_acked
      t.date :proposed_exhibits
      t.date :ready_to_schedule
      t.date :date_scheduled
      t.date :claimant_hearing_prep
      t.date :notice_of_hearing
      t.date :hearing_date
      t.date :supplemental_date
      t.date :expedited
      t.string :decision
      t.date :decision_date
      t.string :alj
      t.string :ve
      t.string :me
      t.date :ac
      t.string :awarded_at
      t.boolean :appeal
      t.boolean :appeal_filed
      t.date :close_out_letter
      t.decimal :costs
      t.decimal :cost_two
      t.decimal :cost_three
      t.date :date_costs_received
      t.date :date_ssdi_received
      t.date :date_ssi_received
      t.string :case_id
      t.string :open

      t.timestamps
    end
  end
end
