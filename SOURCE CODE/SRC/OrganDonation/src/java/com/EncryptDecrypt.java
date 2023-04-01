package com;



public class EncryptDecrypt {

    public static void main(String arg[]) 
    {
        EncryptDecrypt edObj = new EncryptDecrypt();
      
        String str = "buuu";
        String enCryptStr = edObj.Encrypt(str);
        
        System.out.println(" Encrypted string : " + enCryptStr);
        System.out.println(" Decrypted string : " + edObj.Decrypt(enCryptStr));
        
    }

    //Encryption method
    public String Encrypt(String passwd) {
        int i, len, asci_code, temp_val = 0;
        char ch;
        String out_str = new String();
        len = passwd.length();
        for (i = 0; i < len; i++) {
            ch = passwd.charAt(i);
            asci_code = getAscii(ch);
            if (i < len / 2) {
                temp_val = (asci_code * 3) + 10;
            } else {
                temp_val = (asci_code * 4) + 11;
            }
            out_str = out_str + temp_val;
        }
        return out_str;
    }

    public char getCharec(int i) {
        /*for(int x=0;x<=arr.length;x++) {
        if(arr[x] == i) {
        return (chars.charAt(x));
        }
        }
        return 0;*/
        return (char) i;
    }

    public int getAscii(char c) {
        /*for(int x=0;x<=chars.length();x++){
        if(chars.charAt(x) == c) {
        return (arr[x]);
        }
        }
        return 0;*/
        return (int) c;
    }

    /**
     * this function is to decrypt the password
     * @param string password
     */
    public String Decrypt(String passwd) {
        int i, len, asci_code, temp_val = 0;
        String out_str = new String();
        String char_str = new String();
        len = passwd.length();
        for (i = 0; i < len; i += 3) {
            if ((i + 3) <= len) {
                char_str = passwd.substring(i, i + 3);
                asci_code = Integer.parseInt(char_str);
                if (i < (len - 2) / 2) {
                    temp_val = ((asci_code - 10) / 3);
                } else {
                    temp_val = ((asci_code - 11) / 4);
                }
            }
            out_str = out_str + this.getCharec(temp_val);
        }
        return (out_str);
    }
}
