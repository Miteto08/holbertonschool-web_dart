String longestUniqueSubstring(String str) {
    if (str.isEmpty) return "";
    
    String current = "";
    String longest = "";
    Set<String> seen = {};
    
    for (int i = 0; i < str.length; i++) {
        String char = str[i];
        
        if (seen.contains(char)) {
            if (current.length > longest.length) {
                longest = current;
            }
            int index = current.indexOf(char);
            current = current.substring(index + 1);
            seen = current.split('').toSet();
        }
        
        current += char;
        seen.add(char);
    }
    
    if (current.length > longest.length) {
        longest = current;
    }
    
    return longest;
}