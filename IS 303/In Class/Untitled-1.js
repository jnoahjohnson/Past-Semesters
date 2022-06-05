function LongestWord(sen) { 

    // code goes here
    var wordLength = 0;
    var longestWord = "";
    var longestWordLength = 0;
    var word = "";
    
    for (var i = 0; i < sen.length; ++i) {
        if(sen[i] != ' ') {
            wordLength++;
            word = word + sen[i];
        }
        else {
    
            if (wordLength > longestWordLength) {
                longestWord = word;
                console.log(longestWord);
            }
    
            word = "";
            wordLength = 0;
            
        }
    }
    
    return longestWord; 
           
    }
    
    alert(LongestWord("This is a testing center"));