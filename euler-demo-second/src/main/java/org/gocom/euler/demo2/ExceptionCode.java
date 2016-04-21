package org.gocom.euler.demo2;

/**
 * Created by G on 2016/3/15.
 */
public enum ExceptionCode {
    unauthorized(401L, "401 Unauthorized"),
    system_error(10001L, "system_error"),
    not_supported_service(10002L, "not_supported_service"),
    http_client_exception(10003L, "http_client_exception"),
    http_timeout_exception(10004L, "http_timeout_exception"),
    not_found_user(10005L, "not_found_user"),
    username_or_password_error(10006L, "username_or_password_error"),
    un_admin_user(10007L, "un_admin_user"),
    password_error(10008L, "password_error"),
    invalid_private_token(10009L, "invalid_private_token"),
    oauth_error(10010L, "oauth_error"),
    csrf_risk(10011L, "csrf_risk"),
    get_access_token_failed(10012L, "get_access_token_failed"),
    get_user_info_failed(10013L, "get_user_info_failed"),
    invalid_request_parameter(10014L, "invalid_request_parameter"),
    not_found_property(20001L, "not_found_property"),
    load_property_file_failed(20002L, "load_property_file_failed"),
    upload_property_file_failed(20003L, "upload_property_file_failed"),
    unsupported_encoding(20004L, "unsupported_encoding"),
    not_found(30001L, "not_found"),
    ssh_put_failed(40004L, "ssh_put_failed"),
    ssh_script_exec_failed(40005L, "ssh_script_exec_failed"),
    connect_jenkins_failed(40006L, "connect_jenkins_failed"),
    not_supported_job_type(40007L, "not_supported_job_type"),
    create_job_failed(40008L, "create_job_failed"),
    update_job_failed(40009L, "update_job_failed"),
    query_job_failed(40010L, "query_job_failed"),
    trigger_build_failed(40011L, "trigger_build_failed"),
    query_build_failed(40012L, "query_build_failed"),
    failed_generate_deploy_script(40013L, "failed_generate_deploy_script"),
    failed_generate_compile_script(40014L, "failed_generate_compile_script"),
    not_found_host(50001L, "not_found_host");

    private long errorCode;
    private String errorMessage;

    public long getErrorCode() {
        return this.errorCode;
    }

    private ExceptionCode(long errorCode, String param4) {
        this.errorCode = errorCode;
        this.errorMessage = errorMessage;
    }

    public static ExceptionCode getByCode(long errorCode) {
        ExceptionCode[] values = values();
        ExceptionCode[] var3 = values;
        int var4 = values.length;

        for(int var5 = 0; var5 < var4; ++var5) {
            ExceptionCode value = var3[var5];
            if(value.getErrorCode() == errorCode) {
                return value;
            }
        }

        return null;
    }

    public void setErrorCode(long errorCode) {
        this.errorCode = errorCode;
    }

    public String getErrorMessage() {
        return this.errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }
}
