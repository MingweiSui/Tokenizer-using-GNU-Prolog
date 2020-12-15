# Tokenizer-using-GNU-Prolog

## Algorithm:
    1. Take 2 inputs, which String and Split Condition
    2. Get the length of 2 inputs, then convert 2 inputs to 2 ASCII list
    3. run every ASCII decimal number of the string list, compare with every ASCII decimal number of the condition list
    4. if the char not in condition list, then append it to a temp variable (Current_token)
    5. if the char is in conditon list, then append the temp variable (Current_token) to Final Result List (Reslut_list)
    6. After finishing check entire ASCII decimal number of the String, Convert the Final Result list from ASCII decimal number back to String
    7. Print the Final Result.
    
## Pseudocode
    
    cin >> Str >> Condition;
    String Current_token[];
    String Result_list[];
    
    for(i = 0; i < length(Str); i++){
        for(j = 0; j < length(Condition); j++){
	        if(Str[i] == Condition[j]){
			    if(Current_token[] != empty){
				    append(Current_token[] -> Result_list[]);
				}
			}else{
			    append(Str[i] -> Current_token[]);
			}
        }
    }
    print(Result_list[ tokens[] ]);
  
## Sample I/O

    Sample 1 - Split by space
    
    | ?- tokenizer.
    Enter a String: 'Hello Everyone! Welcome!'.
    Split by char(s): ' '.
    Hello
    Everyone!
    Welcome!
    (125 ms) yes
    
    Sample 2 - Split by multiple chars/symbols
    
    | ?- tokenizer.
    Enter a String: '  a -*/*^$*   b     *&&'.
    Split by char(s): ' !@#$%^&*()_+-=/'.
    a
    b
    (78 ms) yes
    
    Sample 3 - Split by multiple chars/symbols
    
    | ?- tokenizer.
    Enter a String: '212AAA-*5BBB3][CCC-=3DDD25$^EEE,;;*FFF-@#!\'?>}'.
    Split by char(s): '0123456789!@#$%^&*()_+=-[]{},.<>?/;\':'.
    AAA
    BBB
    CCC
    DDD
    EEE
    FFF
    (110 ms) yes
    
    Sample 4 - A paragraph from Wikipedia
    
    | ?- tokenizer.
    Enter a String: 'The University of Windsor (U of W or UWindsor) is a public comprehensive and research university in Windsor, Ontario, Canada.[6] It is Canada\'s southernmost university.[7] It has approximately 12,000 full-time and part-time undergraduate students and 4,000 graduate students.[8] Founded in 1963, the University of Windsor has graduated more than 135,000 alumni.[9]'.
    Split by char(s): ' '.
    The
    University
    of
    Windsor
    (U
    of
    W
    or
    UWindsor)
    is
    a
    public
    comprehensive
    and
    research
    university
    in
    Windsor,
    Ontario,
    Canada.[6]
    It
    is
    Canada's
    southernmost
    university.[7]
    It
    has
    approximately
    12,000
    full-time
    and
    part-time
    undergraduate
    students
    and
    4,000
    graduate
    students.[8]
    Founded
    in
    1963,
    the
    University
    of
    Windsor
    has
    graduated
    more
    than
    135,000
    alumni.[9]
    (171 ms) yes
