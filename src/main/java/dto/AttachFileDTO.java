package dto;


public class AttachFileDTO {
   
   private String fileName; // 첨부 파일명
   private String uploadPath; // 
   private String uuid;
   private boolean image;
   
   public AttachFileDTO(String fileName, String uploadPath, String uuid, boolean image) {
      super();
      this.fileName = fileName;
      this.uploadPath = uploadPath;
      this.uuid = uuid;
      this.image = image;
   }

   public AttachFileDTO() { 
   }

   public String getFileName() {
      return fileName;
   }

   public void setFileName(String fileName) {
      this.fileName = fileName;
   }

   public String getUploadPath() {
      return uploadPath;
   }

   public void setUploadPath(String uploadPath) {
      this.uploadPath = uploadPath;
   }

   public String getUuid() {
      return uuid;
   }

   public void setUuid(String uuid) {
      this.uuid = uuid;
   }

   public boolean isImage() {
      return image;
   }

   public void setImage(boolean image) {
      this.image = image;
   } 
   
}