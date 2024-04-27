FactoryBot.define do
    factory(:animal) do
        name { "Sheila" }
        species { 'Bear' }
        status { :healthy }
    end
end
