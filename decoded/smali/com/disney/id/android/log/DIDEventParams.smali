.class public interface abstract Lcom/disney/id/android/log/DIDEventParams;
.super Ljava/lang/Object;
.source "DIDEventParams.java"


# static fields
.field public static final EVENT_PARAM_ACTION_NAME:Ljava/lang/String; = "action_name"

.field public static final EVENT_PARAM_ANON:Ljava/lang/String; = "anon"

.field public static final EVENT_PARAM_APP_ID:Ljava/lang/String; = "appid"

.field public static final EVENT_PARAM_CLIENT_ID:Ljava/lang/String; = "client_id"

.field public static final EVENT_PARAM_CONNECTION_TYPE:Ljava/lang/String; = "connection_type"

.field public static final EVENT_PARAM_CONVERSATION_ID:Ljava/lang/String; = "conversation_id"

.field public static final EVENT_PARAM_CONVERSATION_ID_TIMESTAMP:Ljava/lang/String; = "conversationIdTimeStamp"

.field public static final EVENT_PARAM_CORRELATION_ID:Ljava/lang/String; = "correlation_id"

.field public static final EVENT_PARAM_DIRECT_FLOW_VERSION:Ljava/lang/String; = "direct_flow_version"

.field public static final EVENT_PARAM_ERROR_CATEGORY:Ljava/lang/String; = "error_category"

.field public static final EVENT_PARAM_ERROR_CODES:Ljava/lang/String; = "error_codes"

.field public static final EVENT_PARAM_MAKE_MODEL:Ljava/lang/String; = "make_model"

.field public static final EVENT_PARAM_MOBILE_LAUNCH_ID:Ljava/lang/String; = "mobile_launch_id"

.field public static final EVENT_PARAM_MOBILE_VIEW_ID:Ljava/lang/String; = "mobile_view_id"

.field public static final EVENT_PARAM_OS:Ljava/lang/String; = "os"

.field public static final EVENT_PARAM_PROCESS_TIME:Ljava/lang/String; = "process_time"

.field public static final EVENT_PARAM_SDK_INSTALL_UUID:Ljava/lang/String; = "mobile_install_id"

.field public static final EVENT_PARAM_SDK_VERSION:Ljava/lang/String; = "sdk_version"

.field public static final EVENT_PARAM_SUCCESS:Ljava/lang/String; = "success"

.field public static final EVENT_PARAM_SWID:Ljava/lang/String; = "swid"

.field public static final EVENT_PARAM_USER_AGENT:Ljava/lang/String; = "user_agent"

.field public static final EVENT_VALUE_COMPLETED_EXEC_LOGOUT:Ljava/lang/String; = "event.completed.exec.logout"

.field public static final EVENT_VALUE_COMPLETED_LAUNCH_CREATE_PROFILE:Ljava/lang/String; = "event.completed.launch.profile.create"

.field public static final EVENT_VALUE_COMPLETED_LAUNCH_DISPLAYNAME:Ljava/lang/String; = "event.completed.launch.displayName"

.field public static final EVENT_VALUE_COMPLETED_LAUNCH_FACEBOOK_LOGIN:Ljava/lang/String; = "event.completed.launch.facebook.login"

.field public static final EVENT_VALUE_COMPLETED_LAUNCH_GOOGLE_LOGIN:Ljava/lang/String; = "event.completed.launch.google.login"

.field public static final EVENT_VALUE_COMPLETED_LAUNCH_LOGIN:Ljava/lang/String; = "event.completed.launch.login"

.field public static final EVENT_VALUE_COMPLETED_LAUNCH_PROFILE:Ljava/lang/String; = "event.completed.launch.profile"

.field public static final EVENT_VALUE_COMPLETED_LAUNCH_REAUTH:Ljava/lang/String; = "event.completed.launch.reauth"

.field public static final EVENT_VALUE_COMPLETED_LAUNCH_RECOVERUSERNAME:Ljava/lang/String; = "event.completed.launch.recoverUsername"

.field public static final EVENT_VALUE_COMPLETED_LAUNCH_RESETPASSWORD:Ljava/lang/String; = "event.completed.launch.resetPassword"

.field public static final EVENT_VALUE_COMPLETED_LAUNCH_SOCIAL_REGISTRATION:Ljava/lang/String; = "event.completed.launch.social.registration"

.field public static final EVENT_VALUE_EVENT_TYPE:Ljava/lang/String; = "DisneyIDUI"

.field public static final EVENT_VALUE_EXEC_LOGOUT:Ljava/lang/String; = "event.exec.logout"

.field public static final EVENT_VALUE_LAUNCH_CREATE_PROFILE:Ljava/lang/String; = "event.launch.profile.create"

.field public static final EVENT_VALUE_LAUNCH_DISPLAYNAME:Ljava/lang/String; = "event.launch.displayName"

.field public static final EVENT_VALUE_LAUNCH_FACEBOOK_LOGIN:Ljava/lang/String; = "event.launch.facebook.login"

.field public static final EVENT_VALUE_LAUNCH_GOOGLE_LOGIN:Ljava/lang/String; = "event.launch.google.login"

.field public static final EVENT_VALUE_LAUNCH_LOGIN:Ljava/lang/String; = "event:launch:login"

.field public static final EVENT_VALUE_LAUNCH_PROFILE:Ljava/lang/String; = "event.launch.profile"

.field public static final EVENT_VALUE_LAUNCH_REAUTH:Ljava/lang/String; = "event.launch.reauth"

.field public static final EVENT_VALUE_LAUNCH_RECOVERUSERNAME:Ljava/lang/String; = "event.launch.recoverUsername"

.field public static final EVENT_VALUE_LAUNCH_RESETPASSWORD:Ljava/lang/String; = "event.launch.resetPassword"

.field public static final EVENT_VALUE_LAUNCH_SOCIAL_REGISTRATION:Ljava/lang/String; = "event.launch.social.registration"

.field public static final EVENT_VALUE_PLATFORM_VENDOR:Ljava/lang/String; = "Android"

.field public static final EVENT_VALUE_SERVICE_FAILURE_RESPONSE_GUEST_REFRESH:Ljava/lang/String; = "event.failure.response.service.guest.refresh"

.field public static final EVENT_VALUE_SERVICE_FAILURE_RESPONSE_LOGIN_BLUECOOKIE:Ljava/lang/String; = "event.failure.response.service.login.bluecookie"

.field public static final EVENT_VALUE_SERVICE_REQUEST_GUEST_REFRESH:Ljava/lang/String; = "event.request.service.guest.refresh"

.field public static final EVENT_VALUE_SERVICE_REQUEST_LOGIN_BLUECOOKIE:Ljava/lang/String; = "event.request.service.login.bluecookie"

.field public static final EVENT_VALUE_SERVICE_REQUEST_LOGIN_SOCIAL:Ljava/lang/String; = "event.request.service.social.login"

.field public static final EVENT_VALUE_SERVICE_REQUEST_TOKEN_FORCE_REFRESH:Ljava/lang/String; = "event.request.service.token.force.refresh"

.field public static final EVENT_VALUE_SERVICE_REQUEST_UPDATE_GUEST_MARKETING:Ljava/lang/String; = "event.request.service.guest.update.marketing"

.field public static final EVENT_VALUE_SERVICE_RESPONSE_GUEST_REFRESH:Ljava/lang/String; = "event.succeed.response.service.guest.refresh"

.field public static final EVENT_VALUE_SERVICE_RESPONSE_LOGIN_BLUECOOKIE:Ljava/lang/String; = "event.succeed.response.service.login.bluecookie"

.field public static final EVENT_VALUE_SERVICE_RESPONSE_LOGIN_SOCIAL:Ljava/lang/String; = "event.succeed.response.service.social.login"

.field public static final EVENT_VALUE_SERVICE_RESPONSE_TOKEN_FORCE_REFRESH:Ljava/lang/String; = "event.succeed.response.service.token.force.refresh"

.field public static final EVENT_VALUE_SERVICE_RESPONSE_UPDATE_GUEST_MARKETING:Ljava/lang/String; = "event.succeed.response.service.guest.update.marketing"

.field public static final EVENT_VALUE_SUCCEED_CALLBACK_ONCREATE:Ljava/lang/String; = "event.succeed.callback.onCreate"

.field public static final EVENT_VALUE_SUCCEED_CALLBACK_ONFORCE_TOKEN_REFRESH_FAILURE:Ljava/lang/String; = "event.succeed.callback.onForceTokenRefreshFailure"

.field public static final EVENT_VALUE_SUCCEED_CALLBACK_ONFORCE_TOKEN_REFRESH_SUCCESS:Ljava/lang/String; = "event.succeed.callback.onForceTokenRefreshSuccess"

.field public static final EVENT_VALUE_SUCCEED_CALLBACK_ONLOGIN:Ljava/lang/String; = "event.succeed.callback.onLogin"

.field public static final EVENT_VALUE_SUCCEED_CALLBACK_ONLOGOUT:Ljava/lang/String; = "event.succeed.callback.onLogout"

.field public static final EVENT_VALUE_SUCCEED_CALLBACK_ONLOWTRUST:Ljava/lang/String; = "event.succeed.callback.onLowTrust"

.field public static final EVENT_VALUE_SUCCEED_CALLBACK_ONOPTIN:Ljava/lang/String; = "event.succeed.callback.onOptIn"

.field public static final EVENT_VALUE_SUCCEED_CALLBACK_ONREAUTH:Ljava/lang/String; = "event.succeed.callback.onReauth"

.field public static final EVENT_VALUE_SUCCEED_CALLBACK_ONREFRESH:Ljava/lang/String; = "event.succeed.callback.onRefresh"

.field public static final EVENT_VALUE_SUCCEED_CALLBACK_ONREFRESH_GUEST_DATA_FAILURE:Ljava/lang/String; = "event.succeed.callback.onRefreshGuestDataFailure"

.field public static final EVENT_VALUE_SUCCEED_CALLBACK_ONREFRESH_GUEST_DATA_SUCCESS:Ljava/lang/String; = "event.succeed.callback.onRefreshGuestDataSuccess"

.field public static final EVENT_VALUE_SUCCEED_CALLBACK_ONUPDATE:Ljava/lang/String; = "event.succeed.callback.onUpdate"
