.class public final Lcom/disney/id/android/DIDGuest;
.super Ljava/lang/Object;
.source "DIDGuest.java"

# interfaces
.implements Lcom/disney/id/android/constants/DIDGuestConst;
.implements Lcom/disney/id/android/improvedguestcontroller/DIDCleanGuestInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/disney/id/android/DIDGuest$GuestException;
    }
.end annotation


# static fields
.field private static final S2_COOKIE_ENCODING_CHAR_SET:Ljava/lang/String; = "UTF-8"

.field private static final TAG:Ljava/lang/String;

.field private static final ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static instance:Lcom/disney/id/android/DIDGuest;


# instance fields
.field private guest:Lorg/json/JSONObject;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->ajc$preClinit()V

    .line 24
    const-class v0, Lcom/disney/id/android/DIDGuest;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/DIDGuest;->TAG:Ljava/lang/String;

    .line 26
    const/4 v0, 0x0

    sput-object v0, Lcom/disney/id/android/DIDGuest;->instance:Lcom/disney/id/android/DIDGuest;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    return-void
.end method

.method private static ajc$preClinit()V
    .locals 9

    .prologue
    .line 1
    new-instance v0, Lorg/aspectj/runtime/reflect/Factory;

    const-string v1, "DIDGuest.java"

    const-class v2, Lcom/disney/id/android/DIDGuest;

    invoke-direct {v0, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "update"

    const-string v3, "com.disney.id.android.DIDGuest"

    const-string v4, "org.json.JSONObject"

    const-string v5, "newGuest"

    const-string v6, "com.disney.id.android.DIDGuest$GuestException"

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x38

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/DIDGuest;->ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

    return-void
.end method

.method public static getInstance()Lcom/disney/id/android/DIDGuest;
    .locals 1

    .prologue
    .line 42
    sget-object v0, Lcom/disney/id/android/DIDGuest;->instance:Lcom/disney/id/android/DIDGuest;

    if-nez v0, :cond_0

    .line 43
    new-instance v0, Lcom/disney/id/android/DIDGuest;

    invoke-direct {v0}, Lcom/disney/id/android/DIDGuest;-><init>()V

    sput-object v0, Lcom/disney/id/android/DIDGuest;->instance:Lcom/disney/id/android/DIDGuest;

    .line 46
    :cond_0
    sget-object v0, Lcom/disney/id/android/DIDGuest;->instance:Lcom/disney/id/android/DIDGuest;

    return-object v0
.end method

.method private isURLEncoded(Ljava/lang/String;)Z
    .locals 5
    .param p1, "originalS2Cookie"    # Ljava/lang/String;

    .prologue
    .line 116
    const/4 v0, 0x0

    .line 121
    .local v0, "decodedS2Cookie":Ljava/lang/String;
    :try_start_0
    const-string v2, "UTF-8"

    invoke-static {p1, v2}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x20

    const/16 v4, 0x2b

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 127
    :goto_0
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const/4 v2, 0x1

    :goto_1
    return v2

    .line 122
    :catch_0
    move-exception v1

    .line 123
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    sget-object v2, Lcom/disney/id/android/DIDGuest;->TAG:Ljava/lang/String;

    const-string v3, "Something went wrong decoding the s2 cookie. Is the charset correct?"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 127
    .end local v1    # "e":Ljava/io/UnsupportedEncodingException;
    :cond_0
    const/4 v2, 0x0

    goto :goto_1
.end method

.method private setTokenTimestamps(Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 2
    .param p1, "token"    # Lorg/json/JSONObject;

    .prologue
    .line 131
    const-string v1, "created"

    invoke-static {p1, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "expires"

    invoke-static {p1, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "high_trust"

    invoke-static {p1, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 138
    .end local p1    # "token":Lorg/json/JSONObject;
    :goto_0
    return-object p1

    .line 134
    .restart local p1    # "token":Lorg/json/JSONObject;
    :cond_0
    new-instance v0, Lcom/disney/id/android/DIDToken;

    invoke-direct {v0, p1}, Lcom/disney/id/android/DIDToken;-><init>(Lorg/json/JSONObject;)V

    .line 135
    .local v0, "newToken":Lcom/disney/id/android/DIDToken;
    invoke-virtual {v0}, Lcom/disney/id/android/DIDToken;->setCreated()V

    .line 136
    invoke-virtual {v0}, Lcom/disney/id/android/DIDToken;->setExpired()V

    .line 137
    invoke-virtual {v0}, Lcom/disney/id/android/DIDToken;->setHighTrust()V

    .line 138
    invoke-virtual {v0}, Lcom/disney/id/android/DIDToken;->getTokenJSON()Lorg/json/JSONObject;

    move-result-object p1

    goto :goto_0
.end method

.method private static final update_aroundBody0(Lcom/disney/id/android/DIDGuest;Lorg/json/JSONObject;Lorg/aspectj/lang/JoinPoint;)V
    .locals 6
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDGuest;
    .param p1, "newGuest"    # Lorg/json/JSONObject;

    .prologue
    .line 56
    invoke-static {p1}, Lcom/disney/id/android/DIDUtils;->isNullOrEmpty(Lorg/json/JSONObject;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 57
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/disney/id/android/DIDGuest;->guest:Lorg/json/JSONObject;

    .line 92
    :goto_0
    return-void

    .line 60
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lcom/disney/id/android/DIDGuest;->hasGuest()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 62
    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v0

    .line 63
    .local v0, "iterator":Ljava/util/Iterator;
    :cond_1
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 64
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 65
    .local v1, "key":Ljava/lang/String;
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p0}, Lcom/disney/id/android/DIDGuest;->getGuestJSON()Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 67
    invoke-virtual {p0}, Lcom/disney/id/android/DIDGuest;->getGuestJSON()Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 86
    .end local v0    # "iterator":Ljava/util/Iterator;
    .end local v1    # "key":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 87
    :cond_2
    :goto_2
    invoke-static {p1}, Lcom/disney/id/android/DIDGuest;->validGuestJSON(Lorg/json/JSONObject;)Z

    move-result v2

    if-nez v2, :cond_7

    .line 88
    new-instance v2, Lcom/disney/id/android/DIDGuest$GuestException;

    invoke-direct {v2, p0}, Lcom/disney/id/android/DIDGuest$GuestException;-><init>(Lcom/disney/id/android/DIDGuest;)V

    throw v2

    .line 70
    .restart local v0    # "iterator":Ljava/util/Iterator;
    :cond_3
    :try_start_1
    invoke-virtual {p0}, Lcom/disney/id/android/DIDGuest;->getGuestJSON()Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v2}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v0

    .line 71
    :cond_4
    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 72
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 73
    .restart local v1    # "key":Ljava/lang/String;
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-virtual {p0}, Lcom/disney/id/android/DIDGuest;->getGuestJSON()Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 75
    invoke-virtual {p0}, Lcom/disney/id/android/DIDGuest;->getGuestJSON()Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_3

    .line 78
    .end local v0    # "iterator":Ljava/util/Iterator;
    .end local v1    # "key":Ljava/lang/String;
    :cond_5
    invoke-virtual {p0}, Lcom/disney/id/android/DIDGuest;->hasToken()Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-virtual {p0}, Lcom/disney/id/android/DIDGuest;->getToken()Lcom/disney/id/android/DIDToken;

    move-result-object v2

    invoke-virtual {v2}, Lcom/disney/id/android/DIDToken;->hasHighTrust()Z

    move-result v2

    if-eqz v2, :cond_6

    const-string v2, "token"

    invoke-static {p1, v2}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 80
    const-string v2, "token"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "high_trust"

    invoke-virtual {p0}, Lcom/disney/id/android/DIDGuest;->getToken()Lcom/disney/id/android/DIDToken;

    move-result-object v4

    invoke-virtual {v4}, Lcom/disney/id/android/DIDToken;->getHighTrust()J

    move-result-wide v4

    invoke-static {v4, v5}, Lcom/disney/id/android/DIDUtils;->toISO8601Time(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 82
    :cond_6
    const-string v2, "token"

    invoke-static {p1, v2}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 83
    const-string v2, "token"

    const-string v3, "token"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/disney/id/android/DIDGuest;->setTokenTimestamps(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_2

    .line 90
    :cond_7
    invoke-virtual {p0, p1}, Lcom/disney/id/android/DIDGuest;->guaranteeS2EncodingSafety(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v2

    iput-object v2, p0, Lcom/disney/id/android/DIDGuest;->guest:Lorg/json/JSONObject;

    goto/16 :goto_0
.end method

.method private static final update_aroundBody1$advice(Lcom/disney/id/android/DIDGuest;Lorg/json/JSONObject;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDGuest;
    .param p1, "newGuest"    # Lorg/json/JSONObject;
    .param p2, "thisJoinPoint"    # Lorg/aspectj/lang/JoinPoint;
    .param p3, "ajc$aspectInstance"    # Lcom/disney/id/android/gintonic/aspect/TraceAspect;
    .param p4, "joinPoint"    # Lorg/aspectj/lang/ProceedingJoinPoint;

    .prologue
    .line 36
    invoke-interface {p4}, Lorg/aspectj/lang/ProceedingJoinPoint;->getSignature()Lorg/aspectj/lang/Signature;

    move-result-object v2

    check-cast v2, Lorg/aspectj/lang/reflect/MethodSignature;

    .line 37
    .local v2, "methodSignature":Lorg/aspectj/lang/reflect/MethodSignature;
    invoke-interface {v2}, Lorg/aspectj/lang/reflect/MethodSignature;->getDeclaringType()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    .line 38
    .local v0, "className":Ljava/lang/String;
    invoke-interface {v2}, Lorg/aspectj/lang/reflect/MethodSignature;->getName()Ljava/lang/String;

    move-result-object v1

    .line 40
    .local v1, "methodName":Ljava/lang/String;
    new-instance v4, Lcom/disney/id/android/gintonic/internal/StopWatch;

    invoke-direct {v4}, Lcom/disney/id/android/gintonic/internal/StopWatch;-><init>()V

    .line 41
    .local v4, "stopWatch":Lcom/disney/id/android/gintonic/internal/StopWatch;
    invoke-virtual {v4}, Lcom/disney/id/android/gintonic/internal/StopWatch;->start()V

    .line 42
    invoke-static {p0, p1, p4}, Lcom/disney/id/android/DIDGuest;->update_aroundBody0(Lcom/disney/id/android/DIDGuest;Lorg/json/JSONObject;Lorg/aspectj/lang/JoinPoint;)V

    const/4 v3, 0x0

    .line 43
    .local v3, "result":Ljava/lang/Object;
    invoke-virtual {v4}, Lcom/disney/id/android/gintonic/internal/StopWatch;->stop()V

    .line 45
    invoke-virtual {v4}, Lcom/disney/id/android/gintonic/internal/StopWatch;->getTotalTimeMillis()J

    move-result-wide v6

    invoke-static {v1, v6, v7}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->ajc$inlineAccessMethod$com_disney_id_android_gintonic_aspect_TraceAspect$com_disney_id_android_gintonic_aspect_TraceAspect$buildLogMessage(Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    return-object v3
.end method

.method static validGuestJSON(Lorg/json/JSONObject;)Z
    .locals 1
    .param p0, "json"    # Lorg/json/JSONObject;

    .prologue
    .line 347
    invoke-static {p0}, Lcom/disney/id/android/DIDUtils;->isNullOrEmpty(Lorg/json/JSONObject;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "token"

    invoke-static {p0, v0}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public getDisplayName()Lcom/disney/id/android/DIDDisplayName;
    .locals 2

    .prologue
    .line 262
    new-instance v0, Lcom/disney/id/android/DIDDisplayName;

    iget-object v1, p0, Lcom/disney/id/android/DIDGuest;->guest:Lorg/json/JSONObject;

    invoke-direct {v0, v1}, Lcom/disney/id/android/DIDDisplayName;-><init>(Lorg/json/JSONObject;)V

    return-object v0
.end method

.method public getDisplayNameJSON()Lorg/json/JSONObject;
    .locals 2

    .prologue
    .line 270
    invoke-virtual {p0}, Lcom/disney/id/android/DIDGuest;->hasDisplayName()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 272
    :try_start_0
    iget-object v0, p0, Lcom/disney/id/android/DIDGuest;->guest:Lorg/json/JSONObject;

    const-string v1, "displayName"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 275
    :goto_0
    return-object v0

    .line 273
    :catch_0
    move-exception v0

    .line 275
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getEntitlements()Lcom/disney/id/android/DIDEntitlements;
    .locals 2

    .prologue
    .line 258
    new-instance v0, Lcom/disney/id/android/DIDEntitlements;

    invoke-virtual {p0}, Lcom/disney/id/android/DIDGuest;->getEntitlementsJSONArray()Lorg/json/JSONArray;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/disney/id/android/DIDEntitlements;-><init>(Lorg/json/JSONArray;)V

    return-object v0
.end method

.method public getEntitlementsJSONArray()Lorg/json/JSONArray;
    .locals 2

    .prologue
    .line 245
    invoke-virtual {p0}, Lcom/disney/id/android/DIDGuest;->hasEntitlements()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 247
    :try_start_0
    iget-object v0, p0, Lcom/disney/id/android/DIDGuest;->guest:Lorg/json/JSONObject;

    const-string v1, "entitlements"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 250
    :goto_0
    return-object v0

    .line 248
    :catch_0
    move-exception v0

    .line 250
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getEtag()Ljava/lang/String;
    .locals 2

    .prologue
    .line 283
    invoke-virtual {p0}, Lcom/disney/id/android/DIDGuest;->hasEtag()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 285
    :try_start_0
    iget-object v0, p0, Lcom/disney/id/android/DIDGuest;->guest:Lorg/json/JSONObject;

    const-string v1, "etag"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 288
    :goto_0
    return-object v0

    .line 286
    :catch_0
    move-exception v0

    .line 288
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getGuestJSON()Lorg/json/JSONObject;
    .locals 1

    .prologue
    .line 146
    iget-object v0, p0, Lcom/disney/id/android/DIDGuest;->guest:Lorg/json/JSONObject;

    return-object v0
.end method

.method public getProfile()Lcom/disney/id/android/DIDProfile;
    .locals 2

    .prologue
    .line 224
    new-instance v0, Lcom/disney/id/android/DIDProfile;

    invoke-virtual {p0}, Lcom/disney/id/android/DIDGuest;->getProfileJSON()Lorg/json/JSONObject;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/disney/id/android/DIDProfile;-><init>(Lorg/json/JSONObject;)V

    return-object v0
.end method

.method public getProfileJSON()Lorg/json/JSONObject;
    .locals 2

    .prologue
    .line 210
    invoke-virtual {p0}, Lcom/disney/id/android/DIDGuest;->hasProfile()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 212
    :try_start_0
    iget-object v0, p0, Lcom/disney/id/android/DIDGuest;->guest:Lorg/json/JSONObject;

    const-string v1, "profile"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 215
    :goto_0
    return-object v0

    .line 213
    :catch_0
    move-exception v0

    .line 215
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getS2()Ljava/lang/String;
    .locals 2

    .prologue
    .line 232
    invoke-virtual {p0}, Lcom/disney/id/android/DIDGuest;->hasS2()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 234
    :try_start_0
    iget-object v0, p0, Lcom/disney/id/android/DIDGuest;->guest:Lorg/json/JSONObject;

    const-string v1, "s2"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 237
    :goto_0
    return-object v0

    .line 235
    :catch_0
    move-exception v0

    .line 237
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getToken()Lcom/disney/id/android/DIDToken;
    .locals 2

    .prologue
    .line 202
    new-instance v0, Lcom/disney/id/android/DIDToken;

    invoke-virtual {p0}, Lcom/disney/id/android/DIDGuest;->getTokenJSON()Lorg/json/JSONObject;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/disney/id/android/DIDToken;-><init>(Lorg/json/JSONObject;)V

    return-object v0
.end method

    .method public getTokenJSON()Lorg/json/JSONObject;
    .locals 1

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    return-object v0
.end method

.method guaranteeS2EncodingSafety(Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 4
    .param p1, "guestJSON"    # Lorg/json/JSONObject;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 99
    const-string v2, "s2"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 100
    .local v1, "originalS2Cookie":Ljava/lang/String;
    invoke-direct {p0, v1}, Lcom/disney/id/android/DIDGuest;->isURLEncoded(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 112
    :goto_0
    return-object p1

    .line 105
    :cond_0
    :try_start_0
    const-string v2, "s2"

    const-string v3, "UTF-8"

    invoke-static {v1, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 106
    :catch_0
    move-exception v0

    .line 107
    .local v0, "e":Lorg/json/JSONException;
    sget-object v2, Lcom/disney/id/android/DIDGuest;->TAG:Ljava/lang/String;

    const-string v3, "Could not add encoded s2 cookie back into guest object!"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 108
    .end local v0    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v0

    .line 109
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    sget-object v2, Lcom/disney/id/android/DIDGuest;->TAG:Ljava/lang/String;

    const-string v3, "Something went wrong encoding the s2 cookie. Is the charset correct?"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public hasDisplayName()Z
    .locals 2

    .prologue
    .line 324
    iget-object v0, p0, Lcom/disney/id/android/DIDGuest;->guest:Lorg/json/JSONObject;

    const-string v1, "displayName"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasEntitlements()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 341
    :try_start_0
    iget-object v1, p0, Lcom/disney/id/android/DIDGuest;->guest:Lorg/json/JSONObject;

    const-string v2, "entitlements"

    invoke-static {v1, v2}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/disney/id/android/DIDGuest;->guest:Lorg/json/JSONObject;

    const-string v2, "entitlements"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    if-lez v1, :cond_0

    const/4 v0, 0x1

    .line 343
    :cond_0
    :goto_0
    return v0

    .line 342
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public hasEtag()Z
    .locals 2

    .prologue
    .line 355
    iget-object v0, p0, Lcom/disney/id/android/DIDGuest;->guest:Lorg/json/JSONObject;

    const-string v1, "etag"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasGuest()Z
    .locals 1

    .prologue
    .line 300
    iget-object v0, p0, Lcom/disney/id/android/DIDGuest;->guest:Lorg/json/JSONObject;

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

.method public hasProfile()Z
    .locals 2

    .prologue
    .line 316
    iget-object v0, p0, Lcom/disney/id/android/DIDGuest;->guest:Lorg/json/JSONObject;

    const-string v1, "profile"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasS2()Z
    .locals 2

    .prologue
    .line 332
    iget-object v0, p0, Lcom/disney/id/android/DIDGuest;->guest:Lorg/json/JSONObject;

    const-string v1, "s2"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

    .method public hasToken()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public isAccessTokenExpired()Z
    .locals 4

    .prologue
    .line 165
    invoke-virtual {p0}, Lcom/disney/id/android/DIDGuest;->secondsUntilTokenExpiration()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

    .method public isLoggedIn()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public isRefreshTokenExpired()Z
    .locals 4

    .prologue
    .line 170
    invoke-virtual {p0}, Lcom/disney/id/android/DIDGuest;->secondsUntilRefreshTokenExpiration()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public secondsUntilLowTrust()J
    .locals 2

    .prologue
    .line 178
    invoke-virtual {p0}, Lcom/disney/id/android/DIDGuest;->hasGuest()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/disney/id/android/DIDGuest;->hasToken()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 179
    invoke-virtual {p0}, Lcom/disney/id/android/DIDGuest;->getToken()Lcom/disney/id/android/DIDToken;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/DIDToken;->secondsUntilLowTrust()J

    move-result-wide v0

    .line 180
    :goto_0
    return-wide v0

    :cond_0
    const-wide/16 v0, 0x0

    goto :goto_0
.end method

.method public secondsUntilRefreshTokenExpiration()J
    .locals 2

    .prologue
    .line 160
    invoke-virtual {p0}, Lcom/disney/id/android/DIDGuest;->getToken()Lcom/disney/id/android/DIDToken;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/DIDToken;->getSecondsUntilRefreshTokenExpiration()J

    move-result-wide v0

    return-wide v0
.end method

.method public secondsUntilTokenExpiration()J
    .locals 2

    .prologue
    .line 154
    invoke-virtual {p0}, Lcom/disney/id/android/DIDGuest;->hasGuest()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/disney/id/android/DIDGuest;->hasToken()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 155
    invoke-virtual {p0}, Lcom/disney/id/android/DIDGuest;->getToken()Lcom/disney/id/android/DIDToken;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/DIDToken;->secondsUntilTokenExpiration()J

    move-result-wide v0

    .line 156
    :goto_0
    return-wide v0

    :cond_0
    const-wide/16 v0, 0x0

    goto :goto_0
.end method

.method public update(Lorg/json/JSONObject;)V
    .locals 3
    .param p1, "newGuest"    # Lorg/json/JSONObject;
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/disney/id/android/DIDGuest$GuestException;
        }
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDGuest;->ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, p1, v1, v2, v0}, Lcom/disney/id/android/DIDGuest;->update_aroundBody1$advice(Lcom/disney/id/android/DIDGuest;Lorg/json/JSONObject;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method
