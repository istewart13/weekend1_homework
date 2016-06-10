def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, cash)
  return total_cash = pet_shop[:admin][:total_cash] += cash
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, pets_sold)
  return pet_shop[:admin][:pets_sold] += pets_sold
end

def stock_count(pet_shop)
  return pet_shop[:pets].length
end

def pets_by_breed(pet_shop, breed)
  breed_array = []
  counter = 0
  for pet in pet_shop[:pets]
    pet_breed = pet_shop[:pets][counter][:breed]
    counter += 1 
    if pet_breed == breed
      breed_array << pet_breed
    end
  end
  return breed_array
end

def find_pet_by_name(pet_shop, name)
  counter = 0
  while (counter < pet_shop[:pets].length)
    if (name == pet_shop[:pets][counter][:name])
      return pet_shop[:pets][counter]
    end
    counter += 1
  end
end

def remove_pet_by_name(pet_shop, name)
  counter = 0
  while (counter < pet_shop[:pets].length)
    if (name == pet_shop[:pets][counter][:name])
      pet_shop[:pets].delete_at(counter)
    end
    counter += 1
  end
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end

def customer_pet_count(customer)
  return customer[:pets].count
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end

def customer_can_afford_pet(customer, new_pet)
  return (customer[:cash] >= new_pet[:price])
end

def sell_pet_to_customer(pet_shop, pet, customer)
  if (pet != nil && customer_can_afford_pet(customer, pet))
    add_pet_to_customer(customer, pet)
    customer_pet_count(customer)
    remove_pet_by_name(pet_shop, pet)
    stock_count(pet_shop)
    increase_pets_sold(pet_shop, 1)
    add_or_remove_cash(pet_shop, pet[:price])
  end
end