#playing with some scoring methods

def calc_ba(h,ab)
  ba = (h.to_f/ab.to_f)
#  sprintf("%.3f",ba)[-4,4]
end

def calc_era(er, ip)
  era = 9 * er.to_f / ip.to_f
end

def calc_whip(h,bb,ip)
  whip = (h.to_f + bb.to_f)/ ip.to_f
end

def assign_cat_pts(*cat_scores)
  #validate
  #####WILL NEED TO VALIDATE FIRST ARGUMENT IS EITHER 2 OR 3  
  #
  #pts_available = *(1..num_players).inject(0){|sum,item| sum + item}
  
  if cat_scores.size == 2
    pts_available = 3
  else
    pts_available = 6
  end
  
  #score
  puts "POINTS TO GET:"
  puts pts_available
  puts "\n"
  #cat_scores.each { |s| puts s}
  #array.each_with_index.max = [maximum value, index of that value]
  # dumb way 1
 
   
  #original Jake method
  
  #biggest_ind = 0
  #biggest = cat_scores[biggest_ind]
  #smallest_ind = 0
  #smallest = cat_scores[smallest_ind]
  
  #cat_scores.each_with_index do |v,k|
    #puts k.inspect
    #puts v.inspect
  #  if v > biggest
  #    biggest_ind = k
  #    biggest = v
  #  end
  #  if v < smallest
  #    smallest_ind = k
  #    smallest = v
  #  end
  #end
  
  #let's try it with min, max
  biggest = cat_scores.max
  smallest = cat_scores.min
  biggest_ind = cat_scores.index(cat_scores.max)
  smallest_ind = cat_scores.index(cat_scores.min)
  
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

  returner
end

def assign_cat_pts_low(*cat_scores)
  #validate
  #####WILL NEED TO VALIDATE EITHER 2 OR 3  
  #
  
  if cat_scores.size == 2
    pts_available = 3
  else
    pts_available = 6
  end
  
  #score
  puts "POINTS TO GET:"
  puts pts_available
  puts "\n"
  #array.each_with_index.max = [maximum value, index of that value]

 
  #let's try it with min, max
  biggest = cat_scores.max
  smallest = cat_scores.min
  biggest_ind = cat_scores.index(cat_scores.max)
  smallest_ind = cat_scores.index(cat_scores.min)
  
  #two players
  returner = []
  if cat_scores.size == 2
    returner[smallest_ind] = 2   
    returner[biggest_ind] = 1
  #two players tie
    if biggest == smallest
      returner = [1.5, 1.5]
    end
  else
  # three players 3-way tie
    if cat_scores.uniq.length == 1 
      returner = [2,2,2]
    end
  # three players
    if cat_scores.uniq.length == 3
      returner[smallest_ind] = 3
      returner[biggest_ind] = 1
      all = [0,1,2]
      have = [smallest_ind,biggest_ind]
      returner[(all - have)[0].to_i] = 2
    end
  # three players high-value tie
    if cat_scores.uniq.length == 2 
       if cat_scores.count(biggest) == 2
         returner[smallest_ind] = 3
         returner[biggest_ind] = 1.5
         all = [0,1,2]
         have = [smallest_ind,biggest_ind]
         returner[(all - have)[0].to_i] = 1.5
  # three players low-value tie
       else
         returner[smallest_ind] = 2.5
         returner[biggest_ind] = 1
         all = [0,1,2]
         have = [smallest_ind,biggest_ind]
         returner[(all - have)[0].to_i] = 2.5
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
  
  returner
end
  

