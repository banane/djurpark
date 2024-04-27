require_relative '../rails_helper'

RSpec.describe Employee do
    let!(:emp) do
        create(:employee, 
            first_name: "Beatrix",
            last_name: "Potter",
            email: "beatrix@potter.com",
            phone: "4153342299",
            role: :vet,
            tasks: {"daily": ["blood pressure"], "weekly": ["parasite checks"]}
        )
    end


    it "encrypts proper PII fields" do
        expect(emp.encrypted_attributes.include?(:last_name)).to be_truthy
        expect(emp.encrypted_attributes.include?(:email)).to be_truthy
        expect(emp.encrypted_attributes.include?(:phone)).to be_truthy
    end

end