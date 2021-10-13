package Entity;

public class Comment {
    private int cmtID;
    private int id;
    private int uID;
    private String username;
    private String avatar;
    private String comment;

    public Comment() {

    }

    public Comment(int cmtID, int id, int uID, String username, String avatar, String comment) {
        this.cmtID = cmtID;
        this.id = id;
        this.uID = uID;
        this.username = username;
        this.avatar = avatar;
        this.comment = comment;
    }

    public int getCmtID() {
        return cmtID;
    }

    public void setCmtID(int cmtID) {
        this.cmtID = cmtID;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "cmtID=" + cmtID +
                ", id=" + id +
                ", uID=" + uID +
                ", username='" + username + '\'' +
                ", avatar='" + avatar + '\'' +
                ", comment='" + comment + '\'' +
                '}';
    }
}

