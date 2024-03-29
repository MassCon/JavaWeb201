package step.learning.dto.models;

import org.apache.commons.fileupload.FileItem;
import step.learning.services.formparse.FormParseResult;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.*;
import java.util.regex.Pattern;

public class RegFormModel {

    // region fields
    private String name;
    private String login;
    private String password;
    private String repeat;
    private String email;
    private Date birthdate;
    private boolean isAgree;
    private String avatar; // filename for avatar
    // endregion

    // region accessors
    private void setAvatar(FormParseResult result) throws ParseException {
        Map<String, FileItem> files = result.getFiles();
        if(! files.containsKey("reg-avatar") || files.get("reg-avatar").getSize() == 0) {
            this.avatar = "no-photo.png";
            return;
        }
        FileItem item = files.get("reg-avatar");
        // директорія завантаження файлів (./ - це директорія сервера (Tomcat))
        String targetDir = result.getRequest()
                .getServletContext() // контекст - "оточення" сервелету, з якого дізнаємось файлові шляхи
                .getRealPath("./upload/avatar/");
        String submittedFilename = item.getName();
        // Визначити тип файлу (розширення) та перевірити на перелік дозволених
        String ext = submittedFilename.substring(submittedFilename.lastIndexOf('.'));

        String[] extentions = {".jpg", ".jpeg", ".png"};

        if (!Arrays.asList(extentions).contains(ext)) {
            this.avatar = null;
            return;
        }

        String savedFilename;
        File savedFile ;
        do {
            savedFilename = UUID.randomUUID().toString().substring(0,8) + ext;
            savedFile = new File(targetDir, savedFilename);
        } while (savedFile.exists());
        // Завантажуємо файл
        try {
            item.write(savedFile);
        } catch (Exception e) {
            throw new ParseException("File upload error", 0);
        }
        this.avatar = savedFilename;
    }

    public String getAvatar() {
        return avatar;
    }

    public String getBirthdateAsString() {
        if(getBirthdate() == null) {
            return null;
        }
        return formDate.format(getBirthdate());
    }

    public void setBirthdate(String birthdate) throws ParseException {
        if(birthdate == null || "".equals(birthdate)) {
            this.birthdate = null;
        }
        else {
            this.birthdate = formDate.parse(birthdate);
        }
    }

    public void setIsAgree(String isAgree) {
        this.isAgree = "on".equalsIgnoreCase(isAgree) || "true".equalsIgnoreCase(isAgree) ;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRepeat() {
        return repeat;
    }

    public void setRepeat(String repeat) {
        this.repeat = repeat;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(Date birthdate) {
        this.birthdate = birthdate;
    }

    public boolean isAgree() {
        return isAgree;
    }

    public void setAgree(boolean agree) {
        isAgree = agree;
    }
    // endregion

    public RegFormModel(FormParseResult result) throws ParseException {
        Map<String,String> fields = result.getFields();
        this.setName      ( fields.get( "reg-name"      ) );
        this.setLogin     ( fields.get( "reg-login"     ) );
        this.setPassword  ( fields.get( "reg-password"  ) );
        this.setRepeat    ( fields.get( "reg-repeat"    ) );
        this.setEmail     ( fields.get( "reg-email"     ) );
        this.setIsAgree   ( fields.get( "reg-rules"     ) );
        this.setBirthdate ( fields.get( "reg-birthdate" ) );
        this.setAvatar    ( result );
    }

    public Map<String, String > getErrorMessages() {

        Map<String, String> result = new HashMap<>() ;

        if(login == null || "".equals(login)) {
            result.put("login", "Login cannot be empty");
        }

        if(name == null || "".equals(name)) {
            result.put("name", "The name cannot be empty");
        }

        Pattern pattern = Pattern.compile("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$");

        if(!pattern.matcher(email).matches()) {
            result.put("email", "Invalid e-mail address");
        }

        Date current = new Date();

        if(birthdate == null) {
            result.put("birthdate", "You must enter your date of birth");
        }
        else if(birthdate.compareTo( current ) > 0 ) {
            result.put("birthdate", "Greetings, racer! How is the track?");
        }

        if(password == null || "".equals(password)) {
            result.put("password", "Password cannot be empty");
        }
        else if(password.length() < 3) {
            result.put("password", "The password must be longer than three characters");
        }

        if(repeat == null || "".equals(repeat)) {
            result.put("repeat", "You must repeat the password");
        }
        else if(!password.equals(repeat)) {
            result.put("repeat", "Passwords do not match");
        }

        if(!isAgree) {
            result.put("rules", "You have to agree not to break anything");
        }

        return result;
    }

    private static final SimpleDateFormat formDate = new SimpleDateFormat("yyyy-MM-dd");
}
