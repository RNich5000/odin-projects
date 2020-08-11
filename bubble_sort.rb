def bubble_sort(bubble)
  new_bubble = bubble
  bubble.length.times do
    n = 0
    until n == new_bubble.length-1 do
        if new_bubble[n] > new_bubble [n+1]
          new_bubble[n], new_bubble[n+1] = new_bubble[n+1], new_bubble[n] # swaps the elements
        end
        n += 1
        new_bubble = bubble
    end
  end
  p new_bubble
end

bubble_sort([4,3,78,2,0,2])
