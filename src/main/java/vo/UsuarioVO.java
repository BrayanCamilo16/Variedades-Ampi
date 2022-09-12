package vo;

/**
 *
 * @author Camargo
 */
public class UsuarioVO {

    private int idUsuario;
    private String emailUsuario;
    private String passUsuario;
    private String nombreUsuario;
    private String apellidoUsuario;
    private String numDocumentoUsuario;
    private String telefonoUsuario;
    private String direccionUsuario;
    private String sexoUsuario;
    private boolean estadoUsuario;
    private String idRol;
    private String TipoDocumento;

    public UsuarioVO() {
    }

    public UsuarioVO(String emailUsuario, String passUsuario) {
        this.emailUsuario = emailUsuario;
        this.passUsuario = passUsuario;
    }

    public UsuarioVO(String emailUsuario, String passUsuario, String nombreUsuario, String apellidoUsuario, String numDocumentoUsuario, String telefonoUsuario, String direccionUsuario, String sexoUsuario, boolean estadoUsuario, String idRol, String TipoDocumento) {
        this.emailUsuario = emailUsuario;
        this.passUsuario = passUsuario;
        this.nombreUsuario = nombreUsuario;
        this.apellidoUsuario = apellidoUsuario;
        this.numDocumentoUsuario = numDocumentoUsuario;
        this.telefonoUsuario = telefonoUsuario;
        this.direccionUsuario = direccionUsuario;
        this.sexoUsuario = sexoUsuario;
        this.estadoUsuario = estadoUsuario;
        this.idRol = idRol;
        this.TipoDocumento = TipoDocumento;
    }

    public UsuarioVO(int idUsuario, boolean estadoUsuario) {
        this.idUsuario = idUsuario;
        this.estadoUsuario = estadoUsuario;
    }

    public UsuarioVO(int idUsuario, String TipoDocumento) {
        this.idUsuario = idUsuario;
        this.TipoDocumento = TipoDocumento;
    }

    public UsuarioVO(int idUsuario, String emailUsuario, String passUsuario, String nombreUsuario, String apellidoUsuario, String numDocumentoUsuario, String telefonoUsuario, String direccionUsuario, String sexoUsuario, boolean estadoUsuario, String idRol, String TipoDocumento) {
        this.idUsuario = idUsuario;
        this.emailUsuario = emailUsuario;
        this.passUsuario = passUsuario;
        this.nombreUsuario = nombreUsuario;
        this.apellidoUsuario = apellidoUsuario;
        this.numDocumentoUsuario = numDocumentoUsuario;
        this.telefonoUsuario = telefonoUsuario;
        this.direccionUsuario = direccionUsuario;
        this.sexoUsuario = sexoUsuario;
        this.estadoUsuario = estadoUsuario;
        this.idRol = idRol;
        this.TipoDocumento = TipoDocumento;
    }

    public UsuarioVO(int idUsuario, String emailUsuario, String passUsuario, String nombreUsuario, String apellidoUsuario, String numDocumentoUsuario, String telefonoUsuario, String direccionUsuario, String sexoUsuario, boolean estadoUsuario, String idRol) {
        this.idUsuario = idUsuario;
        this.emailUsuario = emailUsuario;
        this.passUsuario = passUsuario;
        this.nombreUsuario = nombreUsuario;
        this.apellidoUsuario = apellidoUsuario;
        this.numDocumentoUsuario = numDocumentoUsuario;
        this.telefonoUsuario = telefonoUsuario;
        this.direccionUsuario = direccionUsuario;
        this.sexoUsuario = sexoUsuario;
        this.estadoUsuario = estadoUsuario;
        this.idRol = idRol;
    }

    

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getEmailUsuario() {
        return emailUsuario;
    }

    public void setEmailUsuario(String emailUsuario) {
        this.emailUsuario = emailUsuario;
    }

    public String getPassUsuario() {
        return passUsuario;
    }

    public void setPassUsuario(String passUsuario) {
        this.passUsuario = passUsuario;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getApellidoUsuario() {
        return apellidoUsuario;
    }

    public void setApellidoUsuario(String apellidoUsuario) {
        this.apellidoUsuario = apellidoUsuario;
    }

    public String getNumDocumentoUsuario() {
        return numDocumentoUsuario;
    }

    public void setNumDocumentoUsuario(String numDocumentoUsuario) {
        this.numDocumentoUsuario = numDocumentoUsuario;
    }

    public String getTelefonoUsuario() {
        return telefonoUsuario;
    }

    public void setTelefonoUsuario(String telefonoUsuario) {
        this.telefonoUsuario = telefonoUsuario;
    }

    public String getDireccionUsuario() {
        return direccionUsuario;
    }

    public void setDireccionUsuario(String direccionUsuario) {
        this.direccionUsuario = direccionUsuario;
    }

    public String getSexoUsuario() {
        return sexoUsuario;
    }

    public void setSexoUsuario(String sexoUsuario) {
        this.sexoUsuario = sexoUsuario;
    }

    public boolean isEstadoUsuario() {
        return estadoUsuario;
    }

    public void setEstadoUsuario(boolean estadoUsuario) {
        this.estadoUsuario = estadoUsuario;
    }

    public String getIdRol() {
        return idRol;
    }

    public void setIdRol(String idRol) {
        this.idRol = idRol;
    }

    public String getTipoDocumento() {
        return TipoDocumento;
    }

    public void setTipoDocumento(String TipoDocumento) {
        this.TipoDocumento = TipoDocumento;
    }

    @Override
    public String toString() {
        return "UsuarioVO{" + "idUsuario=" + idUsuario + ", emailUsuario=" + emailUsuario + ", passUsuario=" + passUsuario + ", nombreUsuario=" + nombreUsuario + ", apellidoUsuario=" + apellidoUsuario + ", numDocumentoUsuario=" + numDocumentoUsuario + ", telefonoUsuario=" + telefonoUsuario + ", direccionUsuario=" + direccionUsuario + ", sexoUsuario=" + sexoUsuario + ", estadoUsuario=" + estadoUsuario + ", idRol=" + idRol + ", TipoDocumento=" + TipoDocumento + '}';
    }

}
