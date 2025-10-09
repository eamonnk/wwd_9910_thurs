# x = 1.0

# print(type(x))

# if type(x) == float:
#     x=1
#     print(type(x))
    
    
#     def print_type(x):
#         print(type(x))
        
#         print_type(x)
        
        
# def rhyme (flower1="Ross", color1="Red", flower2="violets", color2="blue"):
#     print(flower1, "are", color1)
#     print(flower2, "are", color2)
#     print("sugar is sweet")
#     print("and so are you")

# rhyme()

my_list = ["hello", 1, 1.0, True]



for ele in my_list:
    print(ele)


for i in range(len(my_list)):
    print(my_list[i])
    
my_list.append("banana")
print (my_list)

my_list.remove("banana")

double_list=my_list + my_list
double_list=(my_list * 3)
print(double_list)
treble_list=(double_list * 3)
print(treble_list)
## get every other element
print(treble_list[1:5:2])

numbers = []

for x in range(0,100):
    numbers.append(x)
    
print(numbers)

numbers = [x + 1 for x in range(0,100) if x % 2 == 0]
print(numbers)


numbers = [x for x in range(0,100)]
odds = [1, 3, 5, 7, 9]
evens= [num + 1 for num in odds]

import random

random_numbers = [random.randint(0,30) for x in range(0,100)]
random_numbers.sort()
print(random_numbers)

x = 10, 12
print(x)
print((x[1]))

for ele in x:
    print(ele)
    
def f1(s1, s2, op=4):
    if op==1:
        temp = s1.intersection(s2)
    elif op==2:
        temp = s1.difference(s2)
    else:
        temp = s1.union(s2)
        return temp
    
set1=(set('ab'))
set2= set('cd')
print(f1(set1, set2))
print(f1(set1, set2, 1))
print(f1(set1, set2, 2))

Contacts = {'bill': '333-1234', 'rich' : '269-345', 'jane': '5423-2345'}
print(Contacts)


for key in Contacts:
    print(key)
    
for key, value in Contacts.items():
    print(key, value)
    
for value in Contacts.values():
    print(value)
    
    
def f1(my_dict):
    temp=0
    for value in my_dict.values():
        temp = temp + value
    return temp

def f2(my_dict):
    temp=''
    for key in my_dict:
        if temp < key:
            temp=key
    return temp
    
def f3(my_dict, k, v):
    if k in my_dict:
        my_dict[k] = v

# main
a_dict={'bill': 1, 'rich': 2, 'fred': 10, 'walter':20}
print(f1(a_dict)) # Line 1
print(f2(a_dict)) # Line 2
print(None == f3(a_dict, 'bill', -1)) #Line 3
print(a_dict) # Line 4

text = "standard_number, name, record"
print(text)
details  = text.split(",")
print(details)
details.sort()
print(details)
text=','.join(details)
print(text)