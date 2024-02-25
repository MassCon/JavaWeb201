package step.learning.dto.entities;

import java.util.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

public class AuthToken {
    private String jti  ;   // id
    private String sub  ;   // user-id
    private Date exp    ;   // expires
    private Date iat    ;   // issued at

    public AuthToken( ) { }
    public AuthToken(ResultSet resultSet) throws SQLException {

        this.setJti(resultSet.getString("jti"));
        this.setSub(resultSet.getString("sub"));

        Timestamp moment = resultSet.getTimestamp("exp");
        this.setExp( moment == null ? null : new Date( moment.getTime() ) );

        moment = resultSet.getTimestamp("iat");
        this.setIat( moment == null ? null : new Date( moment.getTime() ) );
    }

    public String getJti() {
        return jti;
    }

    public void setJti(String jti) {
        this.jti = jti;
    }

    public String getSub() {
        return sub;
    }

    public void setSub(String sub) {
        this.sub = sub;
    }

    public Date getExp() {
        return exp;
    }

    public void setExp(Date exp) {
        this.exp = exp;
    }

    public Date getIat() {
        return iat;
    }

    public void setIat(Date iat) {
        this.iat = iat;
    }
}
/*
Ідея - назвати поля сутності як у стандарті JWT.
 */