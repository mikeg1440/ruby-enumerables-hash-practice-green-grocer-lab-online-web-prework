def consolidate_cart(items)							# takes a list of unsorted items and consolidates them with quantities

  hashed_cart = Hash.new

<<<<<<< HEAD
=======
  # if items.kind_of?(Array)
  #   puts "IS ARRAY"
  # elsif items.kind_of?(Hash)
  #   puts "IS HASH"
  # else
  #   puts "SOMETHING ELSE"
  # end

  # if items.size == 1
  #   items.each_pair do |item, attrs|
  #     hashed_cart[item] = attrs
  #     hashed_cart[item][:count] = 1
  #   end
  #   return hashed_cart
  # end
  

>>>>>>> d8f7938b8a3babb6eb690436db49c656a5b83e3d
  items.each do |item|					# iterate through all the items

    item.each do |n,m|

      if !hashed_cart[n]				# if key doesn't exist in hashed_cart then add it with a :count key also ELSE add one to count
        hashed_cart[n] = m
        hashed_cart[n][:count] = 1
      else
        hashed_cart[n][:count] += 1
      end

    end
  end

  hashed_cart
end



def apply_coupons(cart, coupons)						# if we have a coupons for any item then discount the price

  if coupons.empty?											# if no coupons just return the cart
    return cart
  end

  coupons.each do |coupon|              # iterate through coupons

    if cart.keys.include? coupon[:item]      # if cart includes a item with same name of coupon item

<<<<<<< HEAD
=======

>>>>>>> d8f7938b8a3babb6eb690436db49c656a5b83e3d
      item_name = coupon[:item]         # get item details
      item_qty = cart[item_name][:count]
      item_price = cart[item_name][:price]

      discount_qty = coupon[:num]       # get coupon details
      discount_cost = coupon[:cost]

<<<<<<< HEAD
      if cart[item_name][:count] < coupon[:num]     # if coupon requires more quantity then we have for item skip to next coupon
        next
      end


=======
>>>>>>> d8f7938b8a3babb6eb690436db49c656a5b83e3d
      if discount_qty > 1
        discount_price = discount_cost / discount_qty   # calculate price per item
      else
        discount_price = discount_cost
      end

      if cart["#{item_name} W/COUPON"]
<<<<<<< HEAD
      
        cart["#{item_name} W/COUPON"][:count] += discount_qty
        # cart["#{item_name} W/COUPON"][:count] += 1
        
=======
        cart["#{item_name} W/COUPON"][:count] += discount_qty
>>>>>>> d8f7938b8a3babb6eb690436db49c656a5b83e3d
      else
  
        cart["#{item_name} W/COUPON"] = {  									#add a new key and values to cart for discounted items
          :price =>  discount_price,
          :clearance => cart[item_name][:clearance],
          :count => (item_qty >= discount_qty) ? discount_qty : item_qty
        }

      end

<<<<<<< HEAD

			if (item_qty - discount_qty) <= 0					# if all the items are discounted then delete the key
=======
			if (item_qty - discount_qty) <= 0					# if all the items are discounted then delete the key
				#cart.delete(item_name)
>>>>>>> d8f7938b8a3babb6eb690436db49c656a5b83e3d
				cart[item_name][:count] = 0
			else
      	cart[item_name][:count] = item_qty - discount_qty     # deduct discounted items at regular, then add discounted info
			end
<<<<<<< HEAD
    end       # End of if cart.keys.include?
  end       # End of coupons.each do
	cart
=======
    end
  end
	p cart
>>>>>>> d8f7938b8a3babb6eb690436db49c656a5b83e3d
end



def apply_clearance(cart)							# if any items are clearance then discount by 20%

  cart.each do |item, attrs|

    if attrs[:clearance]
      price = attrs[:price]
      # attrs[:price] = "%.2f" % (price * 0.8)
<<<<<<< HEAD
      attrs[:price] = (price * 0.8).to_f.truncate(2)          # set new price to 80% of old price and set precision to two decimals
=======
      attrs[:price] = (price * 0.8).to_f.truncate(2)
>>>>>>> d8f7938b8a3babb6eb690436db49c656a5b83e3d
    end

  end

  cart
end



def checkout(unsorted_items, coupons)						# takes a unsorted list of items, consolidates, applies discounts and returns total

<<<<<<< HEAD

  cart = consolidate_cart(unsorted_items)

  # puts "Consolidated Cart: #{cart}"

  cart = apply_coupons(cart, coupons)

  # puts "Coupons Applied: #{cart}"

  cart = apply_clearance(cart)

 	# puts "Clearance Applied: #{cart}"
=======
  puts "Raw Cart: #{cart}"

  cart = consolidate_cart(unsorted_items)

  puts "Consolidated Cart: #{cart}"

  # if !coupons.empty? 
  #   cart = apply_coupons(cart, coupons)
  # end


  cart = apply_coupons(cart, coupons)

  puts "Coupons Applied: #{cart}"

  cart = apply_clearance(cart)

	puts "Clearance Applied: #{cart}"
>>>>>>> d8f7938b8a3babb6eb690436db49c656a5b83e3d

  total = 0.0

  cart.each do |item, attrs|												# add the total by multipling price by quantity
		total += attrs[:count] * attrs[:price].to_f
  end

  if total > 100          # take an extra 10% off if total is over $100
    total = total * 0.9
  end

  #"%.2f" % total								# format two decimal places for money
  total
end
