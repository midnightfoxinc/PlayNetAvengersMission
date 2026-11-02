.class public Lcom/disney/id/android/guestcontroller/GuestController;
.super Ljava/lang/Object;
.source "GuestController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;
    }
.end annotation


# static fields
.field public static final HEADERS_KEY:Ljava/lang/String; = "headers"

.field public static final RESPONSE_KEY:Ljava/lang/String; = "response"

.field public static final STATUS_KEY:Ljava/lang/String; = "status"

.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 26
    const-class v0, Lcom/disney/id/android/guestcontroller/GuestController;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/guestcontroller/GuestController;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 246
    return-void
.end method

.method public static forceTokenRefresh(Landroid/content/Context;Ljava/util/Map;Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p2, "listener"    # Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 76
    .local p1, "providedHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/DIDGuest;->hasToken()Z

    move-result v0

    if-nez v0, :cond_0

    .line 77
    new-instance v0, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    const-string v1, "AUTHORIZATION_UNEXPECTED_ERROR"

    invoke-direct {v0, v1}, Lcom/disney/id/android/guestcontroller/GuestControllerError;-><init>(Ljava/lang/String;)V

    invoke-interface {p2, v0}, Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;->onErrorResponse(Lcom/disney/id/android/volley/VolleyError;)V

    .line 78
    :cond_0
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/DIDGuest;->getToken()Lcom/disney/id/android/DIDToken;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/DIDToken;->hasRefreshToken()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 79
    invoke-static {p0, p1, p2}, Lcom/disney/id/android/guestcontroller/GuestController;->refreshAuth(Landroid/content/Context;Ljava/util/Map;Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;)V

    .line 85
    :goto_0
    return-void

    .line 80
    :cond_1
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/DIDGuest;->getToken()Lcom/disney/id/android/DIDToken;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/DIDToken;->hasBlueCookie()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 81
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/DIDGuest;->getToken()Lcom/disney/id/android/DIDToken;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/DIDToken;->getBlueCookie()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p0, v0, v1, p2}, Lcom/disney/id/android/guestcontroller/GuestController;->loginBlue(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;)V

    goto :goto_0

    .line 83
    :cond_2
    new-instance v0, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    const-string v1, "AUTHORIZATION_UNEXPECTED_ERROR"

    invoke-direct {v0, v1}, Lcom/disney/id/android/guestcontroller/GuestControllerError;-><init>(Ljava/lang/String;)V

    invoke-interface {p2, v0}, Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;->onErrorResponse(Lcom/disney/id/android/volley/VolleyError;)V

    goto :goto_0
.end method

.method private static getAuthorizationHeader()Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 253
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDGuest;->hasToken()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDGuest;->getToken()Lcom/disney/id/android/DIDToken;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDToken;->hasAccessToken()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 254
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 255
    .local v0, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "Authorization"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "BEARER "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v3

    invoke-virtual {v3}, Lcom/disney/id/android/DIDGuest;->getToken()Lcom/disney/id/android/DIDToken;

    move-result-object v3

    invoke-virtual {v3}, Lcom/disney/id/android/DIDToken;->getAccessToken()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 258
    :goto_0
    return-object v0

    .end local v0    # "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static loginBlue(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;)V
    .locals 10
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "blueCookie"    # Ljava/lang/String;
    .param p3, "listener"    # Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 128
    .local p2, "providedHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez p1, :cond_0

    .line 129
    new-instance v1, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    const-string v3, "AUTHORIZATION_BLUE_COOKIE_INVALID"

    invoke-direct {v1, v3}, Lcom/disney/id/android/guestcontroller/GuestControllerError;-><init>(Ljava/lang/String;)V

    invoke-interface {p3, v1}, Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;->onErrorResponse(Lcom/disney/id/android/volley/VolleyError;)V

    .line 132
    :cond_0
    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9}, Lorg/json/JSONObject;-><init>()V

    .line 134
    .local v9, "params":Lorg/json/JSONObject;
    :try_start_0
    const-string v1, "blueCookie"

    invoke-virtual {v9, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 139
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/disney/id/android/DIDSessionConfig;->getGCBaseUrl()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "/guest/login/blue"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 141
    .local v2, "url":Ljava/lang/String;
    new-instance v0, Lcom/disney/id/android/guestcontroller/GuestControllerRequest;

    const/4 v1, 0x1

    const-class v3, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    invoke-static {p2}, Lcom/disney/id/android/guestcontroller/GuestController;->setHeader(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v4

    invoke-virtual {v9}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Lcom/disney/id/android/guestcontroller/GuestController$5;

    invoke-direct {v6, p3}, Lcom/disney/id/android/guestcontroller/GuestController$5;-><init>(Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;)V

    new-instance v7, Lcom/disney/id/android/guestcontroller/GuestController$6;

    invoke-direct {v7, p3}, Lcom/disney/id/android/guestcontroller/GuestController$6;-><init>(Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;)V

    invoke-direct/range {v0 .. v7}, Lcom/disney/id/android/guestcontroller/GuestControllerRequest;-><init>(ILjava/lang/String;Ljava/lang/Class;Ljava/util/Map;Ljava/lang/String;Lcom/disney/id/android/volley/Response$Listener;Lcom/disney/id/android/volley/Response$ErrorListener;)V

    .line 156
    .local v0, "req":Lcom/disney/id/android/guestcontroller/GuestControllerRequest;
    invoke-static {p0}, Lcom/disney/id/android/volley/VolleyManager;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/volley/VolleyManager;

    move-result-object v1

    sget-object v3, Lcom/disney/id/android/guestcontroller/GuestController;->TAG:Ljava/lang/String;

    invoke-virtual {v1, v0, v3}, Lcom/disney/id/android/volley/VolleyManager;->addToRequestQueue(Lcom/disney/id/android/volley/Request;Ljava/lang/String;)V

    .line 157
    return-void

    .line 135
    .end local v0    # "req":Lcom/disney/id/android/guestcontroller/GuestControllerRequest;
    .end local v2    # "url":Ljava/lang/String;
    :catch_0
    move-exception v8

    .line 136
    .local v8, "e":Lorg/json/JSONException;
    new-instance v1, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    const-string v3, "AUTHORIZATION_BLUE_COOKIE_INVALID"

    invoke-direct {v1, v3}, Lcom/disney/id/android/guestcontroller/GuestControllerError;-><init>(Ljava/lang/String;)V

    invoke-interface {p3, v1}, Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;->onErrorResponse(Lcom/disney/id/android/volley/VolleyError;)V

    goto :goto_0
.end method

.method public static loginSocial(Landroid/content/Context;Ljava/util/Map;Lorg/json/JSONObject;Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;)V
    .locals 8
    .param p0, "context"    # Landroid/content/Context;
    .param p2, "params"    # Lorg/json/JSONObject;
    .param p3, "listener"    # Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lorg/json/JSONObject;",
            "Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 43
    .local p1, "providedHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez p2, :cond_0

    .line 44
    const/4 v1, 0x0

    invoke-interface {p3, v1}, Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;->onErrorResponse(Lcom/disney/id/android/volley/VolleyError;)V

    .line 68
    :goto_0
    return-void

    .line 48
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/disney/id/android/DIDSessionConfig;->getGCBaseUrl()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "/guest/login/social"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 49
    .local v2, "url":Ljava/lang/String;
    const-string v1, "email"

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 50
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "?oneClick=true"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 53
    :cond_1
    new-instance v0, Lcom/disney/id/android/guestcontroller/GuestControllerRequest;

    const/4 v1, 0x1

    const-class v3, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    invoke-static {p1}, Lcom/disney/id/android/guestcontroller/GuestController;->setHeader(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v4

    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Lcom/disney/id/android/guestcontroller/GuestController$1;

    invoke-direct {v6, p3}, Lcom/disney/id/android/guestcontroller/GuestController$1;-><init>(Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;)V

    new-instance v7, Lcom/disney/id/android/guestcontroller/GuestController$2;

    invoke-direct {v7, p3}, Lcom/disney/id/android/guestcontroller/GuestController$2;-><init>(Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;)V

    invoke-direct/range {v0 .. v7}, Lcom/disney/id/android/guestcontroller/GuestControllerRequest;-><init>(ILjava/lang/String;Ljava/lang/Class;Ljava/util/Map;Ljava/lang/String;Lcom/disney/id/android/volley/Response$Listener;Lcom/disney/id/android/volley/Response$ErrorListener;)V

    .line 67
    .local v0, "req":Lcom/disney/id/android/guestcontroller/GuestControllerRequest;
    invoke-static {p0}, Lcom/disney/id/android/volley/VolleyManager;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/volley/VolleyManager;

    move-result-object v1

    sget-object v3, Lcom/disney/id/android/guestcontroller/GuestController;->TAG:Ljava/lang/String;

    invoke-virtual {v1, v0, v3}, Lcom/disney/id/android/volley/VolleyManager;->addToRequestQueue(Lcom/disney/id/android/volley/Request;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static refreshAuth(Landroid/content/Context;Ljava/util/Map;Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;)V
    .locals 12
    .param p0, "context"    # Landroid/content/Context;
    .param p2, "listener"    # Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 93
    .local p1, "providedHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDGuest;->hasToken()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDGuest;->getToken()Lcom/disney/id/android/DIDToken;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDToken;->hasRefreshToken()Z

    move-result v1

    if-nez v1, :cond_1

    .line 94
    :cond_0
    new-instance v1, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    const-string v3, "AUTHORIZATION_UNEXPECTED_ERROR"

    invoke-direct {v1, v3}, Lcom/disney/id/android/guestcontroller/GuestControllerError;-><init>(Ljava/lang/String;)V

    invoke-interface {p2, v1}, Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;->onErrorResponse(Lcom/disney/id/android/volley/VolleyError;)V

    .line 120
    :goto_0
    return-void

    .line 98
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/disney/id/android/DIDSessionConfig;->getGCBaseUrl()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "/guest/refresh-auth/"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v3

    invoke-virtual {v3}, Lcom/disney/id/android/DIDGuest;->getToken()Lcom/disney/id/android/DIDToken;

    move-result-object v3

    invoke-virtual {v3}, Lcom/disney/id/android/DIDToken;->getRefreshToken()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 101
    .local v2, "url":Ljava/lang/String;
    invoke-static {p0}, Lcom/disney/id/android/DIDStateManager;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/DIDStateManager;

    move-result-object v9

    .line 102
    .local v9, "stateManager":Lcom/disney/id/android/DIDStateManager;
    invoke-virtual {v9}, Lcom/disney/id/android/DIDStateManager;->markServiceCallStart()V

    .line 103
    const-string v8, "event:token:refresh"

    .line 104
    .local v8, "actionName":Ljava/lang/String;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    .line 106
    .local v10, "serviceCallStartTime":J
    new-instance v0, Lcom/disney/id/android/guestcontroller/GuestControllerRequest;

    const/4 v1, 0x1

    const-class v3, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    invoke-static {p1}, Lcom/disney/id/android/guestcontroller/GuestController;->setHeader(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v4

    const/4 v5, 0x0

    new-instance v6, Lcom/disney/id/android/guestcontroller/GuestController$3;

    invoke-direct {v6, p2}, Lcom/disney/id/android/guestcontroller/GuestController$3;-><init>(Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;)V

    new-instance v7, Lcom/disney/id/android/guestcontroller/GuestController$4;

    invoke-direct {v7, p2}, Lcom/disney/id/android/guestcontroller/GuestController$4;-><init>(Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;)V

    invoke-direct/range {v0 .. v7}, Lcom/disney/id/android/guestcontroller/GuestControllerRequest;-><init>(ILjava/lang/String;Ljava/lang/Class;Ljava/util/Map;Ljava/lang/String;Lcom/disney/id/android/volley/Response$Listener;Lcom/disney/id/android/volley/Response$ErrorListener;)V

    .line 119
    .local v0, "req":Lcom/disney/id/android/guestcontroller/GuestControllerRequest;
    invoke-static {p0}, Lcom/disney/id/android/volley/VolleyManager;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/volley/VolleyManager;

    move-result-object v1

    sget-object v3, Lcom/disney/id/android/guestcontroller/GuestController;->TAG:Ljava/lang/String;

    invoke-virtual {v1, v0, v3}, Lcom/disney/id/android/volley/VolleyManager;->addToRequestQueue(Lcom/disney/id/android/volley/Request;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static refreshGuestData(Landroid/content/Context;Ljava/util/Map;Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;)V
    .locals 8
    .param p0, "context"    # Landroid/content/Context;
    .param p2, "listener"    # Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 170
    .local p1, "providedHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDGuest;->hasToken()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDGuest;->getToken()Lcom/disney/id/android/DIDToken;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDToken;->hasSWID()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDGuest;->getToken()Lcom/disney/id/android/DIDToken;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDToken;->hasAccessToken()Z

    move-result v1

    if-nez v1, :cond_1

    .line 172
    :cond_0
    new-instance v1, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    const-string v3, "AUTHORIZATION_INVALID_OR_EXPIRED_TOKEN"

    invoke-direct {v1, v3}, Lcom/disney/id/android/guestcontroller/GuestControllerError;-><init>(Ljava/lang/String;)V

    invoke-interface {p2, v1}, Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;->onErrorResponse(Lcom/disney/id/android/volley/VolleyError;)V

    .line 198
    :goto_0
    return-void

    .line 175
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/disney/id/android/DIDSessionConfig;->getGCBaseUrl()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "/guest/"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v3

    invoke-virtual {v3}, Lcom/disney/id/android/DIDGuest;->getToken()Lcom/disney/id/android/DIDToken;

    move-result-object v3

    invoke-virtual {v3}, Lcom/disney/id/android/DIDToken;->getSWID()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 177
    .local v2, "url":Ljava/lang/String;
    invoke-static {}, Lcom/disney/id/android/guestcontroller/GuestController;->getAuthorizationHeader()Ljava/util/Map;

    move-result-object v4

    .line 178
    .local v4, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {v4}, Lcom/disney/id/android/guestcontroller/GuestController;->setHeader(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v4

    .line 179
    if-eqz p1, :cond_2

    .line 180
    invoke-interface {v4, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 183
    :cond_2
    new-instance v0, Lcom/disney/id/android/guestcontroller/GuestControllerRequest;

    const/4 v1, 0x0

    const-class v3, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    const/4 v5, 0x0

    new-instance v6, Lcom/disney/id/android/guestcontroller/GuestController$7;

    invoke-direct {v6, p2}, Lcom/disney/id/android/guestcontroller/GuestController$7;-><init>(Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;)V

    new-instance v7, Lcom/disney/id/android/guestcontroller/GuestController$8;

    invoke-direct {v7, p2}, Lcom/disney/id/android/guestcontroller/GuestController$8;-><init>(Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;)V

    invoke-direct/range {v0 .. v7}, Lcom/disney/id/android/guestcontroller/GuestControllerRequest;-><init>(ILjava/lang/String;Ljava/lang/Class;Ljava/util/Map;Ljava/lang/String;Lcom/disney/id/android/volley/Response$Listener;Lcom/disney/id/android/volley/Response$ErrorListener;)V

    .line 197
    .local v0, "req":Lcom/disney/id/android/guestcontroller/GuestControllerRequest;
    invoke-static {p0}, Lcom/disney/id/android/volley/VolleyManager;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/volley/VolleyManager;

    move-result-object v1

    sget-object v3, Lcom/disney/id/android/guestcontroller/GuestController;->TAG:Ljava/lang/String;

    invoke-virtual {v1, v0, v3}, Lcom/disney/id/android/volley/VolleyManager;->addToRequestQueue(Lcom/disney/id/android/volley/Request;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private static setHeader(Ljava/util/Map;)Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 267
    .local p0, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {}, Lcom/disney/id/android/DIDSessionConfig;->getDebug()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 268
    if-nez p0, :cond_0

    .line 269
    new-instance p0, Ljava/util/HashMap;

    .end local p0    # "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 271
    .restart local p0    # "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    const-string v0, "log-core-requests"

    const-string v1, "true"

    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 274
    :cond_1
    return-object p0
.end method

.method public static updateGuest(Landroid/content/Context;Ljava/util/Map;Lorg/json/JSONObject;Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;)V
    .locals 8
    .param p0, "context"    # Landroid/content/Context;
    .param p2, "guest"    # Lorg/json/JSONObject;
    .param p3, "listener"    # Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lorg/json/JSONObject;",
            "Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 216
    .local p1, "providedHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDGuest;->hasToken()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDGuest;->getToken()Lcom/disney/id/android/DIDToken;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDToken;->hasSWID()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDGuest;->getToken()Lcom/disney/id/android/DIDToken;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDToken;->hasAccessToken()Z

    move-result v1

    if-nez v1, :cond_1

    .line 218
    :cond_0
    const/4 v1, 0x0

    invoke-interface {p3, v1}, Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;->onErrorResponse(Lcom/disney/id/android/volley/VolleyError;)V

    .line 243
    :goto_0
    return-void

    .line 221
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/disney/id/android/DIDSessionConfig;->getGCBaseUrl()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "/guest/"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v3

    invoke-virtual {v3}, Lcom/disney/id/android/DIDGuest;->getToken()Lcom/disney/id/android/DIDToken;

    move-result-object v3

    invoke-virtual {v3}, Lcom/disney/id/android/DIDToken;->getSWID()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 222
    .local v2, "url":Ljava/lang/String;
    invoke-static {}, Lcom/disney/id/android/guestcontroller/GuestController;->getAuthorizationHeader()Ljava/util/Map;

    move-result-object v4

    .line 224
    .local v4, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {v4}, Lcom/disney/id/android/guestcontroller/GuestController;->setHeader(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v4

    .line 225
    if-eqz p1, :cond_2

    .line 226
    invoke-interface {v4, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 229
    :cond_2
    new-instance v0, Lcom/disney/id/android/guestcontroller/GuestControllerRequest;

    const/4 v1, 0x1

    const-class v3, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Lcom/disney/id/android/guestcontroller/GuestController$9;

    invoke-direct {v6, p3}, Lcom/disney/id/android/guestcontroller/GuestController$9;-><init>(Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;)V

    new-instance v7, Lcom/disney/id/android/guestcontroller/GuestController$10;

    invoke-direct {v7, p3}, Lcom/disney/id/android/guestcontroller/GuestController$10;-><init>(Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;)V

    invoke-direct/range {v0 .. v7}, Lcom/disney/id/android/guestcontroller/GuestControllerRequest;-><init>(ILjava/lang/String;Ljava/lang/Class;Ljava/util/Map;Ljava/lang/String;Lcom/disney/id/android/volley/Response$Listener;Lcom/disney/id/android/volley/Response$ErrorListener;)V

    .line 242
    .local v0, "req":Lcom/disney/id/android/guestcontroller/GuestControllerRequest;
    invoke-static {p0}, Lcom/disney/id/android/volley/VolleyManager;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/volley/VolleyManager;

    move-result-object v1

    sget-object v3, Lcom/disney/id/android/guestcontroller/GuestController;->TAG:Ljava/lang/String;

    invoke-virtual {v1, v0, v3}, Lcom/disney/id/android/volley/VolleyManager;->addToRequestQueue(Lcom/disney/id/android/volley/Request;Ljava/lang/String;)V

    goto :goto_0
.end method
