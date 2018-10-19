def pet_shop_name(pet_shop)
  for name in pet_shop
    return @pet_shop[:name]
  end
end

def total_cash(pet_shop)
  sum = pet_shop[:admin][:total_cash]
  return sum
end

def add_or_remove_cash(pet_shop, amount)
    pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
  total_pets_sold = pet_shop[:admin][:pets_sold]
  return total_pets_sold
end

def increase_pets_sold(pet_shop, number_of_pets_added)
  pet_shop[:admin][:pets_sold] += number_of_pets_added
end
#pop pet from array, and add cost to total cost

def stock_count(pet_shop)
  total_stock = pet_shop[:pets].length
  return total_stock
end

def pets_by_breed(pet_shop, breed)
  total_pets_of_breed = []
  for pet in pet_shop[:pets]
    if pet[:breed] == breed
      total_pets_of_breed.push(pet[:name])
    end
  end
  return total_pets_of_breed
end

def find_pet_by_name(pet_shop, pet_name)
  for pet in pet_shop[:pets]
    if pet[:name] == pet_name
        return pet
    end
  end
  return nil
end

def remove_pet_by_name(pet_shop, pet_name)
  for pet in pet_shop[:pets]
    if pet[:name] == pet_name
      pet_shop[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, amount)
  customer[:cash] -= amount
end

def customer_pet_count(customer)
  return customer[:pets].count
end

def add_pet_to_customer(customer, pet)
  customer[:pets].push(pet)
end

def customer_can_afford_pet(customer, pet)
  if customer[:cash] >= pet[:price]
    return true
  else
    return false
  end
end

def sell_pet_to_customer(pet_shop, pet, customer)
  if pet == nil
     return
  end

  if customer_can_afford_pet(customer, pet) == true
    price = pet[:price]

    remove_customer_cash(customer, price)
    add_or_remove_cash(pet_shop, price)
    increase_pets_sold(pet_shop, 1)
    add_pet_to_customer(customer, pet)
  end
end
