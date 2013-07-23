#playing with some scoring methods

def assign_cat_pts(*cat_scores)
  #validate
  #####WILL NEED TO VALIDATE FIRST ARGUMENT IS EITHER 2 OR 3  
  #
  #pts_available = *(1..num_players).inject(0){|sum,item| sum + item}
  num_players = cat_scores.size
  
  if num_players == 2
    pts_available = 3
  else
    pts_available = 6
  end
  #score
  puts "POINTS TO GET:"
  puts pts_available
  puts "\n"
  #cat_scores.each { |s| puts s}
  
  # dumb way 1
  
  biggest_ind = 0
  biggest = cat_scores[biggest_ind]
  smallest_ind = 0
  smallest = cat_scores[smallest_ind]
  
  cat_scores.each_with_index do |v,k|
    #puts k.inspect
    #puts v.inspect
    if v > biggest
      biggest_ind = k
      biggest = v
    end
    if v < smallest
      smallest_ind = k
      smallest = v
    end
  end
  
  
  
  returner = []
  if cat_scores.size == 2
    returner[smallest_ind] = 1
    returner[biggest_ind] = 2
    if biggest == smallest
      returner = [1.5, 1.5]
    end
  else
    ### THREE (3) categories to compare
    if cat_scores.uniq.length == 1 
      returner = [2,2,2]
    end
    if cat_scores.uniq.length == 3
      returner[smallest_ind] = 1
      returner[biggest_ind] = 3
      all = [0,1,2]
      have = [smallest_ind,biggest_ind]
      returner[(all - have)[0].to_i] = 2
    end
    if cat_scores.uniq.length == 2 
       if cat_scores.count(biggest) == 2
         returner[smallest_ind] = 1
         returner[biggest_ind] = 2.5
         all = [0,1,2]
         have = [smallest_ind,biggest_ind]
         returner[(all - have)[0].to_i] = 2.5
        #### 2 SMALLESTS
       else
         returner[smallest_ind] = 1.5
         returner[biggest_ind] = 3
         all = [0,1,2]
         have = [smallest_ind,biggest_ind]
         returner[(all - have)[0].to_i] = 1.5
       end
    end
  
  
  end
  
  
  
  
  
  
  puts "Method will return: " + returner.inspect
  
  puts "\n"
  puts "\nnumber of scores: "+cat_scores.size.inspect
  
  puts "\nbiggest: "+biggest.to_s
  puts "\n"+biggest_ind.to_s
  puts "\nsmallest: "+smallest.to_s
  puts "\n"+smallest_ind.to_s
end


