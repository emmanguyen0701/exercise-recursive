require "byebug"

def range(s_num, e_num)
    return [] if s_num > e_num
    return [s_num] if  e_num - s_num == 1
    [s_num] + range(s_num + 1, e_num)
end

def sum_re(arr)
    return nil if arr.empty?
    return arr[0] if arr.length == 1
    arr[0] + sum_re(arr[1..-1])
end

def sum_ite(arr)
   total = 0
   arr.each do |el|
    total += el
   end
   total
end

def exp1(base, num)
    return 1 if num == 0
    return base if num == 1
    base * exp1(base, num - 1 )
end

def deep_dup(arr)
    new_arr = []
    arr.each do |el|
        if el.is_a? Array
            new_arr << deep_dup(el)          
        else
            new_arr << el
        end
    end
    new_arr
end
# array = [1, [2], [3, [4]]]
# p deep_dup(array)
# new_array = array.dup
# new_array << "VYV"
# p array
# p new_array

def fibonacci_ite(n)
    arr = [0,1]
    arr.take(n) if n <= 2
    (n-2).times do 
        num = arr[-2] + arr[-1]
        arr << num
    end
    arr
end

def fib_re(n)
    if n <= 2
        [0,1].take(n)
    else
        fib = fib_re(n-1)
        fib << fib[-2] + fib[-1]
    end
end

def quick_sort(arr)
    return arr if arr.length <= 1
    pivot_arr = [arr.first]
    left_side = arr[1..-1].select { |el| el < arr.first }
    right_side = arr[1..-1].select { |el| el >= arr.first }
    quick_sort(left_side) + pivot_arr + quick_sort(right_side)
end

def greedy_make_change(amount, coins = [0.50,  0.25, 0.10, 0.05])
    time = amount / coins[0]
    n = time.round(half: :up)
    change = n * coins.first
end
# p greedy_make_change(4.30, coins = [0.50,  0.25, 0.10, 0.05])

def make_change(amount, coins = [25, 10, 5, 1])
    return [] if amount == 0
    return nil if coins.none? { |el| el <= amount }

    best_change = nil
    coins.each_with_index do |coin, idx|
        next if coin > amount
          
        remainder = amount - coin
        best_remainder = make_change(remainder, coins[idx..-1])
        next if best_remainder.nil?

        this_change = [coin] + best_remainder


        if best_change.nil? || this_change.count < best_change.count
            best_change = this_change
        end
    end

    best_change
end

p make_change(34, coins = [25, 10, 5, 1])


