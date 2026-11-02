.class public final Lcom/disney/id/android/DIDWebUtils;
.super Ljava/lang/Object;
.source "DIDWebUtils.java"


# static fields
.field private static final DIDTARGET_EXTERNAL:Ljava/lang/String; = "didtarget=external"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static determineConnectionType(Landroid/content/Context;)Ljava/lang/String;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 60
    const-string v2, "connectivity"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    .line 61
    .local v1, "cm":Landroid/net/ConnectivityManager;
    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 62
    .local v0, "activeNetwork":Landroid/net/NetworkInfo;
    if-eqz v0, :cond_2

    .line 63
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 64
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    .line 71
    :goto_0
    return-object v2

    .line 66
    :cond_0
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnectedOrConnecting()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 67
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " (connecting)"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 69
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " (disconnected)"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 71
    :cond_2
    const-string v2, "none"

    goto :goto_0
.end method

.method public static externalTargetUrl(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 102
    invoke-static {p1}, Lcom/disney/id/android/DIDUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 103
    const-string v2, "&didtarget=external?(?=&|$)|didtarget=external?(&|$)"

    invoke-static {v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 104
    .local v1, "m":Ljava/util/regex/Matcher;
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 105
    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/util/regex/Matcher;->replaceFirst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 106
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 108
    .local v0, "i":Landroid/content/Intent;
    :try_start_0
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 109
    const/4 v2, 0x1

    .line 113
    .end local v0    # "i":Landroid/content/Intent;
    .end local v1    # "m":Ljava/util/regex/Matcher;
    :goto_0
    return v2

    .line 110
    .restart local v0    # "i":Landroid/content/Intent;
    .restart local v1    # "m":Ljava/util/regex/Matcher;
    :catch_0
    move-exception v2

    .line 113
    .end local v0    # "i":Landroid/content/Intent;
    .end local v1    # "m":Ljava/util/regex/Matcher;
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static getRequestCodeStr(I)Ljava/lang/String;
    .locals 1
    .param p0, "requestCode"    # I

    .prologue
    .line 220
    sparse-switch p0, :sswitch_data_0

    .line 258
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    .line 222
    :sswitch_0
    const-string v0, "REQUEST_LOGIN"

    goto :goto_0

    .line 224
    :sswitch_1
    const-string v0, "REQUEST_REAUTH"

    goto :goto_0

    .line 226
    :sswitch_2
    const-string v0, "REQUEST_SOCIAL_REGISTRATION"

    goto :goto_0

    .line 228
    :sswitch_3
    const-string v0, "REQUEST_REFRESH_GUEST_DATA"

    goto :goto_0

    .line 230
    :sswitch_4
    const-string v0, "REQUEST_LOGOUT"

    goto :goto_0

    .line 232
    :sswitch_5
    const-string v0, "REQUEST_CREATE_PROFILE"

    goto :goto_0

    .line 234
    :sswitch_6
    const-string v0, "REQUEST_UPDATE_PROFILE"

    goto :goto_0

    .line 236
    :sswitch_7
    const-string v0, "REQUEST_FORGOT_USERNAME"

    goto :goto_0

    .line 238
    :sswitch_8
    const-string v0, "REQUEST_FORGOT_PASSWORD"

    goto :goto_0

    .line 240
    :sswitch_9
    const-string v0, "REQUEST_UPDATE_DISPLAYNAME"

    goto :goto_0

    .line 242
    :sswitch_a
    const-string v0, "REQUEST_REFRESH_TOKEN"

    goto :goto_0

    .line 244
    :sswitch_b
    const-string v0, "REQUEST_REFRESH_TOKEN_INTERNAL"

    goto :goto_0

    .line 246
    :sswitch_c
    const-string v0, "REQUEST_PPU"

    goto :goto_0

    .line 248
    :sswitch_d
    const-string v0, "REQUEST_LOW_TRUST"

    goto :goto_0

    .line 250
    :sswitch_e
    const-string v0, "REQUEST_NEW_PROSPECT"

    goto :goto_0

    .line 252
    :sswitch_f
    const-string v0, "REQUEST_FACEBOOK_LOGIN"

    goto :goto_0

    .line 254
    :sswitch_10
    const-string v0, "REQUEST_GOOGLE_LOGIN"

    goto :goto_0

    .line 256
    :sswitch_11
    const-string v0, "REQUEST_LOGIN_BLUE"

    goto :goto_0

    .line 220
    :sswitch_data_0
    .sparse-switch
        0x100 -> :sswitch_0
        0x101 -> :sswitch_1
        0x102 -> :sswitch_6
        0x103 -> :sswitch_5
        0x104 -> :sswitch_7
        0x105 -> :sswitch_8
        0x106 -> :sswitch_9
        0x107 -> :sswitch_e
        0x108 -> :sswitch_2
        0x200 -> :sswitch_4
        0x201 -> :sswitch_3
        0x202 -> :sswitch_a
        0x203 -> :sswitch_b
        0x204 -> :sswitch_c
        0x205 -> :sswitch_d
        0x206 -> :sswitch_11
        0x300 -> :sswitch_f
        0x301 -> :sswitch_10
    .end sparse-switch
.end method

.method public static getResultCodeStr(I)Ljava/lang/String;
    .locals 1
    .param p0, "resultCode"    # I

    .prologue
    .line 145
    packed-switch p0, :pswitch_data_0

    .line 209
    :pswitch_0
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    .line 147
    :pswitch_1
    const-string v0, "RESULT_LOGGED_IN"

    goto :goto_0

    .line 149
    :pswitch_2
    const-string v0, "RESULT_LOGGED_OUT"

    goto :goto_0

    .line 151
    :pswitch_3
    const-string v0, "RESULT_PROFILE_CREATE"

    goto :goto_0

    .line 153
    :pswitch_4
    const-string v0, "RESULT_PROFILE_UPDATE"

    goto :goto_0

    .line 155
    :pswitch_5
    const-string v0, "RESULT_FORCE_TOKEN_REFRESH_SUCCESS"

    goto :goto_0

    .line 157
    :pswitch_6
    const-string v0, "RESULT_FORCE_TOKEN_REFRESH_FAILURE"

    goto :goto_0

    .line 159
    :pswitch_7
    const-string v0, "RESULT_REFRESH_GUEST_DATA_SUCCESS"

    goto :goto_0

    .line 161
    :pswitch_8
    const-string v0, "RESULT_REFRESH_GUEST_DATA_FAILURE"

    goto :goto_0

    .line 163
    :pswitch_9
    const-string v0, "RESULT_LOGGED_BLUE_SUCCESS"

    goto :goto_0

    .line 165
    :pswitch_a
    const-string v0, "RESULT_LOGGED_BLUE_FAILURE"

    goto :goto_0

    .line 167
    :pswitch_b
    const-string v0, "RESULT_REAUTH"

    goto :goto_0

    .line 169
    :pswitch_c
    const-string v0, "RESULT_REFRESH"

    goto :goto_0

    .line 171
    :pswitch_d
    const-string v0, "RESULT_OPT_IN"

    goto :goto_0

    .line 173
    :pswitch_e
    const-string v0, "RESULT_LOW_TRUST"

    goto :goto_0

    .line 175
    :pswitch_f
    const-string v0, "ERROR_INTERNAL"

    goto :goto_0

    .line 177
    :pswitch_10
    const-string v0, "ERROR_NO_INTERNET"

    goto :goto_0

    .line 179
    :pswitch_11
    const-string v0, "RESULT_CANCELED"

    goto :goto_0

    .line 181
    :pswitch_12
    const-string v0, "ERROR_HOST_LOOKUP"

    goto :goto_0

    .line 183
    :pswitch_13
    const-string v0, "ERROR_UNSUPPORTED_AUTH_SCHEME"

    goto :goto_0

    .line 185
    :pswitch_14
    const-string v0, "ERROR_AUTHENTICATION"

    goto :goto_0

    .line 187
    :pswitch_15
    const-string v0, "ERROR_PROXY_AUTHENTICATION"

    goto :goto_0

    .line 189
    :pswitch_16
    const-string v0, "ERROR_CONNECT"

    goto :goto_0

    .line 191
    :pswitch_17
    const-string v0, "ERROR_IO"

    goto :goto_0

    .line 193
    :pswitch_18
    const-string v0, "ERROR_TIMEOUT"

    goto :goto_0

    .line 195
    :pswitch_19
    const-string v0, "ERROR_REDIRECT_LOOP"

    goto :goto_0

    .line 197
    :pswitch_1a
    const-string v0, "ERROR_UNSUPPORTED_SCHEME"

    goto :goto_0

    .line 199
    :pswitch_1b
    const-string v0, "ERROR_FAILED_SSL_HANDSHAKE"

    goto :goto_0

    .line 201
    :pswitch_1c
    const-string v0, "ERROR_BAD_URL"

    goto :goto_0

    .line 203
    :pswitch_1d
    const-string v0, "ERROR_FILE"

    goto :goto_0

    .line 205
    :pswitch_1e
    const-string v0, "ERROR_FILE_NOT_FOUND"

    goto :goto_0

    .line 207
    :pswitch_1f
    const-string v0, "ERROR_TOO_MANY_REQUESTS"

    goto :goto_0

    .line 145
    nop

    :pswitch_data_0
    .packed-switch -0xf
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_f
        :pswitch_11
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_10
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_e
        :pswitch_d
        :pswitch_b
        :pswitch_c
        :pswitch_7
        :pswitch_8
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_9
        :pswitch_a
    .end packed-switch
.end method

.method public static getVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 25
    const-string v0, "3.1.4"

    return-object v0
.end method

.method public static isConnected(Landroid/content/Context;)Z
    .locals 7
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 36
    if-nez p0, :cond_1

    .line 56
    :cond_0
    :goto_0
    return v4

    .line 38
    :cond_1
    const-string v6, "connectivity"

    invoke-virtual {p0, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    .line 41
    .local v1, "cm":Landroid/net/ConnectivityManager;
    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 42
    .local v0, "activeNetwork":Landroid/net/NetworkInfo;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 43
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v4

    if-eq v4, v5, :cond_2

    .line 45
    :try_start_0
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 46
    .local v2, "cmClass":Ljava/lang/Class;
    const-string v4, "getMobileDataEnabled"

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Class;

    invoke-virtual {v2, v4, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 47
    .local v3, "method":Ljava/lang/reflect/Method;
    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 49
    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v3, v1, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    goto :goto_0

    .line 50
    .end local v2    # "cmClass":Ljava/lang/Class;
    .end local v3    # "method":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v4

    :cond_2
    move v4, v5

    .line 54
    goto :goto_0
.end method

.method static isInternalRequest(I)Z
    .locals 1
    .param p0, "requestCode"    # I

    .prologue
    .line 90
    const/16 v0, 0x203

    if-ne p0, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static isOfflineRequest(I)Z
    .locals 1
    .param p0, "requestCode"    # I

    .prologue
    .line 123
    const/16 v0, 0x200

    if-ne p0, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isSilentRequest(I)Z
    .locals 1
    .param p0, "requestCode"    # I

    .prologue
    .line 81
    const/16 v0, 0x200

    if-eq p0, v0, :cond_0

    const/16 v0, 0x201

    if-eq p0, v0, :cond_0

    const/16 v0, 0x202

    if-eq p0, v0, :cond_0

    const/16 v0, 0x203

    if-eq p0, v0, :cond_0

    const/16 v0, 0x206

    if-ne p0, v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static reportNetworkError(Landroid/content/Context;Lcom/disney/id/android/DIDRequest;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "request"    # Lcom/disney/id/android/DIDRequest;

    .prologue
    const/4 v2, 0x7

    .line 131
    new-instance v0, Lcom/disney/id/android/DIDResponse;

    new-instance v1, Lcom/disney/id/android/DIDException;

    invoke-direct {v1, v2}, Lcom/disney/id/android/DIDException;-><init>(I)V

    invoke-direct {v0, v2, p1, v1}, Lcom/disney/id/android/DIDResponse;-><init>(ILcom/disney/id/android/DIDRequest;Lcom/disney/id/android/DIDException;)V

    .line 135
    .local v0, "response":Lcom/disney/id/android/DIDResponse;
    invoke-static {p0}, Lcom/disney/id/android/DIDSessionManager;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/DIDSessionManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/disney/id/android/DIDSessionManager;->sendResponse(Lcom/disney/id/android/DIDResponse;)V

    .line 136
    return-void
.end method
