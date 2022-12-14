from collections import deque
import sys

n = 9
n_list = [1, 2, 5, 4, 3, 3, 6, 6, 2]
n_list = n_list +[-3]

queue = deque()
index = deque()
boom = deque()

answer = []

while True:
    max_n = max(n_list)
    
    for i, j in enumerate(n_list):
        if j == -3:
            sys.exit()
            
        if j == max_n:
            queue.append(n_list[i-1])
            queue.append(n_list[i+1])
            
            index.append(i-1)
            index.append(i+1)
            
            boom.append(j)
            boom.append(j)
            
            n_list[i] = -1
            
            answer.append(i+1)
            
            while queue:
                num = queue.popleft()
                num_index = index.popleft()
                x = boom.popleft()
                
                if num > 0:
                    if x > num:
                        queue.append(n_list[num_index - 1])
                        queue.append(n_list[num_index + 1])
                        
                        index.append(num_index - 1)
                        index.append(num_index + 1)
                        
                        boom.append(num)
                        boom.append(num)
                        
                        n_list[num_index] = -1

answer.sort()
for i in answer:
    print(i)     
