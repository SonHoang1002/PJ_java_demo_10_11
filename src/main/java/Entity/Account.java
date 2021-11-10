package Entity;

public class Account {
    private int uID;
    private String username;
    private String password;
    private String soDT;
    private String avatar;
    private String email;
    private int isSell;
    private int isAdmin;

    public Account() {
    }

    public Account(int uID, String username, String password, String soDT, String avatar, String email, int isSell, int isAdmin) {
        this.uID = uID;
        this.username = username;
        this.password = password;
        this.soDT = soDT;
        this.avatar = avatar;
        this.email = email;
        this.isSell = isSell;
        this.isAdmin = isAdmin;
    }

    public int getuID() {
        return uID;
    }

    public void setuID(int uID) {
        this.uID = uID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSoDT() {
        return soDT;
    }

    public void setSoDT(String soDT) {
        this.soDT = soDT;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getIsSell() {
        return isSell;
    }

    public void setIsSell(int isSell) {
        this.isSell = isSell;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

    @Override
    public String toString() {
        return "Account{" +
                "uID=" + uID +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", soDT='" + soDT + '\'' +
                ", avatar='" + avatar + '\'' +
                ", email='" + email + '\'' +
                ", isSell=" + isSell +
                ", isAdmin=" + isAdmin +
                '}';
    }
}
