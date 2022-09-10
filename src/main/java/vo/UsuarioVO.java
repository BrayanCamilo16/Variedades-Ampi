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
    private int idRol;
    private String TipoDocumento;

    public UsuarioVO(int idUsuario, String emailUsuario, String passUsuario, String nombreUsuario, String apellidoUsuario, String numDocumentoUsuario, String telefonoUsuario, String direccionUsuario, String sexoUsuario, String TipoDocumento) {
        this.idUsuario = idUsuario;
        this.emailUsuario = emailUsuario;
        this.passUsuario = passUsuario;
        this.nombreUsuario = nombreUsuario;
        this.apellidoUsuario = apellidoUsuario;
        this.numDocumentoUsuario = numDocumentoUsuario;
        this.telefonoUsuario = telefonoUsuario;
        this.direccionUsuario = direccionUsuario;
        this.sexoUsuario = sexoUsuario;
        this.TipoDocumento = TipoDocumento;
    }
    
    public UsuarioVO() {
    }

    public UsuarioVO(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public UsuarioVO(String emailUsuario, String passUsuario) {
        this.emailUsuario = emailUsuario;
        this.passUsuario = passUsuario;
    }

    public UsuarioVO(int idUsuario, String emailUsuario, String passUsuario, int idRol) {
        this.idUsuario = idUsuario;
        this.emailUsuario = emailUsuario;
        this.passUsuario = passUsuario;
        this.idRol = idRol;
    }

    public UsuarioVO(int idUsuario, String nombreUsuario, String apellidoUsuario, String numDocumentoUsuario, String telefonoUsuario, String direccionUsuario, String sexoUsuario, boolean estadoUsuario) {
        this.idUsuario = idUsuario;
        this.nombreUsuario = nombreUsuario;
        this.apellidoUsuario = apellidoUsuario;
        this.numDocumentoUsuario = numDocumentoUsuario;
        this.telefonoUsuario = telefonoUsuario;
        this.direccionUsuario = direccionUsuario;
        this.sexoUsuario = sexoUsuario;
        this.estadoUsuario = estadoUsuario;
    }

    public UsuarioVO(int idUsuario, String emailUsuario, String passUsuario, String nombreUsuario, String apellidoUsuario, String numDocumentoUsuario, String telefonoUsuario, String direccionUsuario, String sexoUsuario, boolean estadoUsuario, int idRol) {
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

    public UsuarioVO(String emailUsuario, String passUsuario, String nombreUsuario, String apellidoUsuario, String numDocumentoUsuario, String telefonoUsuario, String direccionUsuario, String sexoUsuario, boolean estadoUsuario, int idRol, String TipoDocumento) {
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

    public int getIdUsuario() {
        return this.idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getEmailUsuario() {
        return this.emailUsuario;
    }

    public void setEmailUsuario(String emailUsuario) {
        this.emailUsuario = emailUsuario;
    }

    public String getPassUsuario() {
        return this.passUsuario;
    }

    public void setPassUsuario(String passUsuario) {
        this.passUsuario = passUsuario;
    }

    public String getNombreUsuario() {
        return this.nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getApellidoUsuario() {
        return this.apellidoUsuario;
    }

    public void setApellidoUsuario(String apellidoUsuario) {
        this.apellidoUsuario = apellidoUsuario;
    }

    public String getNumDocumentoUsuario() {
        return this.numDocumentoUsuario;
    }

    public void setNumDocumentoUsuario(String numDocumentoUsuario) {
        this.numDocumentoUsuario = numDocumentoUsuario;
    }

    public String getTelefonoUsuario() {
        return this.telefonoUsuario;
    }

    public void setTelefonoUsuario(String telefonoUsuario) {
        this.telefonoUsuario = telefonoUsuario;
    }

    public String getDireccionUsuario() {
        return this.direccionUsuario;
    }

    public void setDireccionUsuario(String direccionUsuario) {
        this.direccionUsuario = direccionUsuario;
    }

    public String getSexoUsuario() {
        return this.sexoUsuario;
    }

    public void setSexoUsuario(String sexoUsuario) {
        this.sexoUsuario = sexoUsuario;
    }

    public boolean isEstadoUsuario() {
        return this.estadoUsuario;
    }

    public void setEstadoUsuario(boolean estadoUsuario) {
        this.estadoUsuario = estadoUsuario;
    }

    public int getIdRol() {
        return this.idRol;
    }

    public void setIdRol(int idRol) {
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
        return "UsuarioVO{" + "idUsuario=" + idUsuario + ", emailUsuario=" + emailUsuario + ", passUsuario=" + passUsuario + ", nombreUsuario=" + nombreUsuario + ", apellidoUsuario=" + apellidoUsuario + ", numDocumentoUsuario=" + numDocumentoUsuario + ", telefonoUsuario=" + telefonoUsuario + ", direccionUsuario=" + direccionUsuario + ", sexoUsuario=" + sexoUsuario + ", estadoUsuario=" + estadoUsuario + ", idRol=" + idRol + '}';
    }

}
