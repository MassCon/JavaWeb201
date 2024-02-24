package step.learning.services.formparse;

import org.apache.commons.fileupload.FileItem;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;

public interface FormParseResult {
    Map<String, String> getFields();
    Map<String, FileItem> getFiles();
    HttpServletRequest getRequest();
}