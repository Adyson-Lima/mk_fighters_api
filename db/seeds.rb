puts 'Gerando fighters...'

5.times do |i|
  Fighter.create(
    name: ["kabal", "raiden", "baraka"].sample ,
    description: "super fighters"
    )
end

puts 'fighters gerados com sucesso!'