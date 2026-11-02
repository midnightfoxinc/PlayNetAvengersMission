.class public final Lcom/disney/id/android/DIDToken;
.super Ljava/lang/Object;
.source "DIDToken.java"

# interfaces
.implements Lcom/disney/id/android/constants/DIDTokenConst;
.implements Lcom/disney/id/android/improvedguestcontroller/DIDCleanTokenInterface;


# instance fields
.field private final token:Lorg/json/JSONObject;


# direct methods
.method protected constructor <init>(Lorg/json/JSONObject;)V
    .locals 0
    .param p1, "data"    # Lorg/json/JSONObject;

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lcom/disney/id/android/DIDToken;->token:Lorg/json/JSONObject;

    .line 16
    return-void
.end method


# virtual methods
.method public getAccessToken()Ljava/lang/String;
    .locals 2

    .prologue
    .line 25
    iget-object v0, p0, Lcom/disney/id/android/DIDToken;->token:Lorg/json/JSONObject;

    const-string v1, "access_token"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAuthenticator()Ljava/lang/String;
    .locals 2

    .prologue
    .line 68
    iget-object v0, p0, Lcom/disney/id/android/DIDToken;->token:Lorg/json/JSONObject;

    const-string v1, "authenticator"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getBlueCookie()Ljava/lang/String;
    .locals 2

    .prologue
    .line 33
    iget-object v0, p0, Lcom/disney/id/android/DIDToken;->token:Lorg/json/JSONObject;

    const-string v1, "blue_cookie"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCreated()J
    .locals 2

    .prologue
    .line 56
    iget-object v0, p0, Lcom/disney/id/android/DIDToken;->token:Lorg/json/JSONObject;

    const-string v1, "created"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/disney/id/android/DIDUtils;->toUnixTime(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getExpires()J
    .locals 2

    .prologue
    .line 60
    iget-object v0, p0, Lcom/disney/id/android/DIDToken;->token:Lorg/json/JSONObject;

    const-string v1, "expires"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/disney/id/android/DIDUtils;->toUnixTime(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getHighTrust()J
    .locals 2

    .prologue
    .line 64
    iget-object v0, p0, Lcom/disney/id/android/DIDToken;->token:Lorg/json/JSONObject;

    const-string v1, "high_trust"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/disney/id/android/DIDUtils;->toUnixTime(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getLowTrust()Z
    .locals 4

    .prologue
    .line 90
    invoke-virtual {p0}, Lcom/disney/id/android/DIDToken;->hasAccessToken()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/disney/id/android/DIDToken;->hasHighTrust()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/disney/id/android/DIDToken;->secondsUntilLowTrust()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gtz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getRefreshTTL()I
    .locals 2

    .prologue
    .line 48
    iget-object v0, p0, Lcom/disney/id/android/DIDToken;->token:Lorg/json/JSONObject;

    const-string v1, "refresh_ttl"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getInt(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getRefreshToken()Ljava/lang/String;
    .locals 2

    .prologue
    .line 29
    iget-object v0, p0, Lcom/disney/id/android/DIDToken;->token:Lorg/json/JSONObject;

    const-string v1, "refresh_token"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSWID()Ljava/lang/String;
    .locals 2

    .prologue
    .line 41
    iget-object v0, p0, Lcom/disney/id/android/DIDToken;->token:Lorg/json/JSONObject;

    const-string v1, "swid"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getScope()Ljava/lang/String;
    .locals 2

    .prologue
    .line 52
    iget-object v0, p0, Lcom/disney/id/android/DIDToken;->token:Lorg/json/JSONObject;

    const-string v1, "scope"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSecondsUntilAccessTokenExpiration()J
    .locals 2

    .prologue
    .line 167
    invoke-virtual {p0}, Lcom/disney/id/android/DIDToken;->secondsUntilTokenExpiration()J

    move-result-wide v0

    return-wide v0
.end method

.method public getSecondsUntilRefreshTokenExpiration()J
    .locals 6

    .prologue
    .line 172
    iget-object v2, p0, Lcom/disney/id/android/DIDToken;->token:Lorg/json/JSONObject;

    const-string v3, "refresh_expires"

    invoke-static {v2, v3}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/disney/id/android/DIDUtils;->toUnixTime(Ljava/lang/String;)J

    move-result-wide v0

    .line 174
    .local v0, "refreshTokenExpirationTime":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long v2, v0, v2

    const-wide/16 v4, 0x3e8

    div-long/2addr v2, v4

    return-wide v2
.end method

.method public getSso()Ljava/lang/String;
    .locals 2

    .prologue
    .line 37
    iget-object v0, p0, Lcom/disney/id/android/DIDToken;->token:Lorg/json/JSONObject;

    const-string v1, "sso"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTTL()I
    .locals 2

    .prologue
    .line 45
    iget-object v0, p0, Lcom/disney/id/android/DIDToken;->token:Lorg/json/JSONObject;

    const-string v1, "ttl"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getInt(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getTokenJSON()Lorg/json/JSONObject;
    .locals 1

    .prologue
    .line 21
    iget-object v0, p0, Lcom/disney/id/android/DIDToken;->token:Lorg/json/JSONObject;

    return-object v0
.end method

.method public hasAccessToken()Z
    .locals 2

    .prologue
    .line 132
    iget-object v0, p0, Lcom/disney/id/android/DIDToken;->token:Lorg/json/JSONObject;

    const-string v1, "access_token"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasBlueCookie()Z
    .locals 2

    .prologue
    .line 138
    iget-object v0, p0, Lcom/disney/id/android/DIDToken;->token:Lorg/json/JSONObject;

    const-string v1, "blue_cookie"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasCreated()Z
    .locals 2

    .prologue
    .line 156
    iget-object v0, p0, Lcom/disney/id/android/DIDToken;->token:Lorg/json/JSONObject;

    const-string v1, "created"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasExpires()Z
    .locals 2

    .prologue
    .line 159
    iget-object v0, p0, Lcom/disney/id/android/DIDToken;->token:Lorg/json/JSONObject;

    const-string v1, "expires"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasHighTrust()Z
    .locals 2

    .prologue
    .line 162
    iget-object v0, p0, Lcom/disney/id/android/DIDToken;->token:Lorg/json/JSONObject;

    const-string v1, "high_trust"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasRefreshTTL()Z
    .locals 2

    .prologue
    .line 150
    iget-object v0, p0, Lcom/disney/id/android/DIDToken;->token:Lorg/json/JSONObject;

    const-string v1, "refresh_ttl"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasRefreshToken()Z
    .locals 2

    .prologue
    .line 135
    iget-object v0, p0, Lcom/disney/id/android/DIDToken;->token:Lorg/json/JSONObject;

    const-string v1, "refresh_token"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasSWID()Z
    .locals 2

    .prologue
    .line 144
    iget-object v0, p0, Lcom/disney/id/android/DIDToken;->token:Lorg/json/JSONObject;

    const-string v1, "swid"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasScope()Z
    .locals 2

    .prologue
    .line 153
    iget-object v0, p0, Lcom/disney/id/android/DIDToken;->token:Lorg/json/JSONObject;

    const-string v1, "scope"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasSso()Z
    .locals 2

    .prologue
    .line 141
    iget-object v0, p0, Lcom/disney/id/android/DIDToken;->token:Lorg/json/JSONObject;

    const-string v1, "sso"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasTTL()Z
    .locals 2

    .prologue
    .line 147
    iget-object v0, p0, Lcom/disney/id/android/DIDToken;->token:Lorg/json/JSONObject;

    const-string v1, "ttl"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasToken()Z
    .locals 1

    .prologue
    .line 129
    iget-object v0, p0, Lcom/disney/id/android/DIDToken;->token:Lorg/json/JSONObject;

    invoke-static {v0}, Lcom/disney/id/android/DIDUtils;->isNullOrEmpty(Lorg/json/JSONObject;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public newHighTrust()V
    .locals 4

    .prologue
    .line 122
    :try_start_0
    iget-object v0, p0, Lcom/disney/id/android/DIDToken;->token:Lorg/json/JSONObject;

    const-string v1, "high_trust"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/disney/id/android/DIDUtils;->toISO8601Time(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 124
    :goto_0
    return-void

    .line 123
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public secondsUntilLowTrust()J
    .locals 6

    .prologue
    const-wide/16 v4, 0x3e8

    .line 83
    invoke-virtual {p0}, Lcom/disney/id/android/DIDToken;->getHighTrust()J

    move-result-wide v0

    div-long/2addr v0, v4

    sget-wide v2, Lcom/disney/id/android/DIDToken;->HIGH_TRUST_WINDOW_IN_SECONDS:J

    add-long/2addr v0, v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    div-long/2addr v2, v4

    sub-long/2addr v0, v2

    return-wide v0
.end method

.method public secondsUntilTokenExpiration()J
    .locals 6

    .prologue
    const-wide/16 v4, 0x3e8

    .line 75
    invoke-virtual {p0}, Lcom/disney/id/android/DIDToken;->getExpires()J

    move-result-wide v0

    div-long/2addr v0, v4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    div-long/2addr v2, v4

    sub-long/2addr v0, v2

    return-wide v0
.end method

.method public setCreated()V
    .locals 4

    .prologue
    .line 94
    invoke-virtual {p0}, Lcom/disney/id/android/DIDToken;->hasToken()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/disney/id/android/DIDToken;->hasCreated()Z

    move-result v0

    if-nez v0, :cond_0

    .line 96
    :try_start_0
    iget-object v0, p0, Lcom/disney/id/android/DIDToken;->token:Lorg/json/JSONObject;

    const-string v1, "created"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/disney/id/android/DIDUtils;->toISO8601Time(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 99
    :cond_0
    :goto_0
    return-void

    .line 97
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public setExpired()V
    .locals 8

    .prologue
    const-wide/16 v6, 0x3e8

    .line 101
    invoke-virtual {p0}, Lcom/disney/id/android/DIDToken;->hasToken()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Lcom/disney/id/android/DIDToken;->hasTTL()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Lcom/disney/id/android/DIDToken;->hasExpires()Z

    move-result v2

    if-nez v2, :cond_0

    .line 102
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 104
    .local v0, "currentTime":J
    :try_start_0
    iget-object v2, p0, Lcom/disney/id/android/DIDToken;->token:Lorg/json/JSONObject;

    const-string v3, "expires"

    invoke-virtual {p0}, Lcom/disney/id/android/DIDToken;->getTTL()I

    move-result v4

    int-to-long v4, v4

    mul-long/2addr v4, v6

    add-long/2addr v4, v0

    invoke-static {v4, v5}, Lcom/disney/id/android/DIDUtils;->toISO8601Time(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    .line 108
    :goto_0
    invoke-virtual {p0}, Lcom/disney/id/android/DIDToken;->hasRefreshToken()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 110
    :try_start_1
    iget-object v2, p0, Lcom/disney/id/android/DIDToken;->token:Lorg/json/JSONObject;

    const-string v3, "refresh_expires"

    invoke-virtual {p0}, Lcom/disney/id/android/DIDToken;->getRefreshTTL()I

    move-result v4

    int-to-long v4, v4

    mul-long/2addr v4, v6

    add-long/2addr v4, v0

    invoke-static {v4, v5}, Lcom/disney/id/android/DIDUtils;->toISO8601Time(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 115
    .end local v0    # "currentTime":J
    :cond_0
    :goto_1
    return-void

    .line 112
    .restart local v0    # "currentTime":J
    :catch_0
    move-exception v2

    goto :goto_1

    .line 106
    :catch_1
    move-exception v2

    goto :goto_0
.end method

.method public setHighTrust()V
    .locals 1

    .prologue
    .line 117
    invoke-virtual {p0}, Lcom/disney/id/android/DIDToken;->hasToken()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/disney/id/android/DIDToken;->hasHighTrust()Z

    move-result v0

    if-nez v0, :cond_0

    .line 118
    invoke-virtual {p0}, Lcom/disney/id/android/DIDToken;->newHighTrust()V

    .line 119
    :cond_0
    return-void
.end method
