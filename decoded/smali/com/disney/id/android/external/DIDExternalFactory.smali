.class public final Lcom/disney/id/android/external/DIDExternalFactory;
.super Ljava/lang/Object;
.source "DIDExternalFactory.java"


# static fields
.field private static final FACEBOOK_EXTERNAL:Ljava/lang/String; = "com.disney.id.android.facebook.DIDFacebookExternal"

.field private static final GOOGLE_PLUS_EXTERNAL:Ljava/lang/String; = "com.disney.id.android.googleplus.DIDGooglePlusExternal"

.field private static final TAG:Ljava/lang/String;

.field private static instance:Lcom/disney/id/android/external/DIDExternalFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 9
    const-class v0, Lcom/disney/id/android/external/DIDExternalFactory;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/external/DIDExternalFactory;->TAG:Ljava/lang/String;

    .line 11
    const/4 v0, 0x0

    sput-object v0, Lcom/disney/id/android/external/DIDExternalFactory;->instance:Lcom/disney/id/android/external/DIDExternalFactory;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    return-void
.end method

.method private static getNameOfClass(I)Ljava/lang/String;
    .locals 1
    .param p0, "externalId"    # I

    .prologue
    .line 48
    packed-switch p0, :pswitch_data_0

    .line 54
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 50
    :pswitch_0
    const-string v0, "com.disney.id.android.facebook.DIDFacebookExternal"

    goto :goto_0

    .line 52
    :pswitch_1
    const-string v0, "com.disney.id.android.googleplus.DIDGooglePlusExternal"

    goto :goto_0

    .line 48
    nop

    :pswitch_data_0
    .packed-switch 0x300
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static instance()Lcom/disney/id/android/external/DIDExternalFactory;
    .locals 1

    .prologue
    .line 22
    sget-object v0, Lcom/disney/id/android/external/DIDExternalFactory;->instance:Lcom/disney/id/android/external/DIDExternalFactory;

    if-nez v0, :cond_0

    .line 23
    new-instance v0, Lcom/disney/id/android/external/DIDExternalFactory;

    invoke-direct {v0}, Lcom/disney/id/android/external/DIDExternalFactory;-><init>()V

    sput-object v0, Lcom/disney/id/android/external/DIDExternalFactory;->instance:Lcom/disney/id/android/external/DIDExternalFactory;

    .line 25
    :cond_0
    sget-object v0, Lcom/disney/id/android/external/DIDExternalFactory;->instance:Lcom/disney/id/android/external/DIDExternalFactory;

    return-object v0
.end method

.method public static isExternal(I)Z
    .locals 1
    .param p0, "externalId"    # I

    .prologue
    .line 58
    const/16 v0, 0x300

    if-eq p0, v0, :cond_0

    const/16 v0, 0x301

    if-ne p0, v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public createExternal(I)Lcom/disney/id/android/external/DIDExternal;
    .locals 6
    .param p1, "externalId"    # I

    .prologue
    const/4 v3, 0x0

    .line 33
    invoke-static {p1}, Lcom/disney/id/android/external/DIDExternalFactory;->getNameOfClass(I)Ljava/lang/String;

    move-result-object v0

    .line 34
    .local v0, "className":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 35
    sget-object v2, Lcom/disney/id/android/external/DIDExternalFactory;->TAG:Ljava/lang/String;

    invoke-static {v2}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "External ID not supported [External ID: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v2, v3

    .line 44
    :goto_0
    return-object v2

    .line 39
    :cond_0
    :try_start_0
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 41
    .local v1, "didExternal":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_1
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/disney/id/android/external/DIDExternal;
    :try_end_1
    .catch Ljava/lang/InstantiationException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 43
    .end local v1    # "didExternal":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_0
    move-exception v2

    :goto_1
    move-object v2, v3

    .line 44
    goto :goto_0

    .line 42
    .restart local v1    # "didExternal":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_1
    move-exception v2

    goto :goto_1

    :catch_2
    move-exception v2

    goto :goto_1
.end method

.method public createExternal(Ljava/lang/String;)Lcom/disney/id/android/external/DIDExternal;
    .locals 1
    .param p1, "namespace"    # Ljava/lang/String;

    .prologue
    .line 29
    invoke-static {p1}, Lcom/disney/id/android/external/DIDExternalUtils;->getRequestCode(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/disney/id/android/external/DIDExternalFactory;->createExternal(I)Lcom/disney/id/android/external/DIDExternal;

    move-result-object v0

    return-object v0
.end method
