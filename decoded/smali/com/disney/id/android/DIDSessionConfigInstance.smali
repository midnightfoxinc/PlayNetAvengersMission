.class public Lcom/disney/id/android/DIDSessionConfigInstance;
.super Ljava/lang/Object;
.source "DIDSessionConfigInstance.java"


# static fields
.field static final CLIENT_ID_KEY:Ljava/lang/String; = "did_client_id"

.field static final COUNTRY_PREFERENCE_KEY:Ljava/lang/String; = "did_country_pref"

.field static final CSS_OVERRIDE_URL_KEY:Ljava/lang/String; = "did_css_override_url"

.field static final DEBUG_KEY:Ljava/lang/String; = "did_debug"

.field static final DEFAULT_LANG_PREF:Ljava/lang/String; = "en-US"

.field static final DO_NOT_DISTURB_KEY:Ljava/lang/String; = "did_do_not_disturb"

.field private static final ENVIRONMENT_CONFIGURATIONS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/disney/id/android/EnvironmentInformation;",
            ">;"
        }
    .end annotation
.end field

.field public static final ENV_DEV:Ljava/lang/String; = "dev"

.field static final ENV_KEY:Ljava/lang/String; = "did_env"

.field public static final ENV_PROD:Ljava/lang/String; = "prod"

.field public static final ENV_PROD_DARK:Ljava/lang/String; = "dark"

.field public static final ENV_QA:Ljava/lang/String; = "qa"

.field public static final ENV_STG:Ljava/lang/String; = "stg"

.field public static final ENV_STG_DARK:Ljava/lang/String; = "stg.dark"

.field static final HIDE_STATUS_BAR_KEY:Ljava/lang/String; = "did_hide_status_bar"

.field private static final LANDING_VERSION:Ljava/lang/String; = "v2"

.field static final LANGUAGE_PREFERENCE_KEY:Ljava/lang/String; = "did_lang_pref"

.field private static final META_DATA_MISSING_MESSAGE:Ljava/lang/String; = "No meta-data was found in the AndroidManifest.xml file."

.field private static final TAG:Ljava/lang/String;

.field private static final ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_1:Lorg/aspectj/lang/JoinPoint$StaticPart;


# instance fields
.field private canUseSiteRequest:Lcom/disney/id/android/DIDRequest;

.field private clientId:Ljava/lang/String;

.field private countryPreference:Ljava/lang/String;

.field private cssOverrideUrl:Ljava/lang/String;

.field private debug:Ljava/lang/Boolean;

.field private doNotDisturb:Ljava/lang/Boolean;

.field private env:Ljava/lang/String;

.field private languagePreference:Ljava/lang/String;

.field private statusBarHidden:Ljava/lang/Boolean;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    invoke-static {}, Lcom/disney/id/android/DIDSessionConfigInstance;->ajc$preClinit()V

    .line 41
    const-class v0, Lcom/disney/id/android/DIDSessionConfigInstance;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/DIDSessionConfigInstance;->TAG:Ljava/lang/String;

    .line 42
    invoke-static {}, Lcom/disney/id/android/DIDSessionConfigUtils;->loadEnvironments()Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/DIDSessionConfigInstance;->ENVIRONMENT_CONFIGURATIONS:Ljava/util/Map;

    return-void
.end method

.method constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    const-string v0, "en-US"

    iput-object v0, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->languagePreference:Ljava/lang/String;

    .line 51
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->debug:Ljava/lang/Boolean;

    .line 52
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->statusBarHidden:Ljava/lang/Boolean;

    .line 53
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->doNotDisturb:Ljava/lang/Boolean;

    .line 64
    iput-object v1, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->languagePreference:Ljava/lang/String;

    .line 65
    iput-object v1, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->debug:Ljava/lang/Boolean;

    .line 66
    iput-object v1, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->statusBarHidden:Ljava/lang/Boolean;

    .line 67
    iput-object v1, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->doNotDisturb:Ljava/lang/Boolean;

    .line 68
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x0

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    const-string v1, "en-US"

    iput-object v1, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->languagePreference:Ljava/lang/String;

    .line 51
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->debug:Ljava/lang/Boolean;

    .line 52
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->statusBarHidden:Ljava/lang/Boolean;

    .line 53
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->doNotDisturb:Ljava/lang/Boolean;

    .line 84
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/disney/id/android/DIDSessionConfigUtils;->getApplicationMetaData(Landroid/content/Context;)Landroid/os/Bundle;

    move-result-object v0

    .line 85
    .local v0, "metaData":Landroid/os/Bundle;
    if-nez v0, :cond_0

    .line 86
    sget-object v1, Lcom/disney/id/android/DIDSessionConfigInstance;->TAG:Ljava/lang/String;

    invoke-static {v1}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "No meta-data was found in the AndroidManifest.xml file."

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    :goto_0
    return-void

    .line 90
    :cond_0
    const-string v1, "did_env"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/disney/id/android/DIDSessionConfigInstance;->setEnv(Ljava/lang/String;)Lcom/disney/id/android/DIDSessionConfigInstance;

    .line 91
    const-string v1, "did_client_id"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/disney/id/android/DIDSessionConfigInstance;->setClientId(Ljava/lang/String;)Lcom/disney/id/android/DIDSessionConfigInstance;

    .line 92
    const-string v1, "did_lang_pref"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/disney/id/android/DIDSessionConfigInstance;->setLanguagePreference(Ljava/lang/String;)Lcom/disney/id/android/DIDSessionConfigInstance;

    .line 93
    const-string v1, "did_css_override_url"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/disney/id/android/DIDSessionConfigInstance;->setCssOverrideUrl(Ljava/lang/String;)Lcom/disney/id/android/DIDSessionConfigInstance;

    .line 94
    const-string v1, "did_country_pref"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/disney/id/android/DIDSessionConfigInstance;->setCountryPreference(Ljava/lang/String;)Lcom/disney/id/android/DIDSessionConfigInstance;

    .line 95
    const-string v1, "did_debug"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/disney/id/android/DIDSessionConfigInstance;->setDebug(Ljava/lang/Boolean;)Lcom/disney/id/android/DIDSessionConfigInstance;

    .line 96
    const-string v1, "did_hide_status_bar"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/disney/id/android/DIDSessionConfigInstance;->setStatusBarHidden(Ljava/lang/Boolean;)Lcom/disney/id/android/DIDSessionConfigInstance;

    .line 97
    const-string v1, "did_do_not_disturb"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/disney/id/android/DIDSessionConfigInstance;->setDoNotDisturb(Ljava/lang/Boolean;)Lcom/disney/id/android/DIDSessionConfigInstance;

    goto :goto_0
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "env"    # Ljava/lang/String;
    .param p2, "clientId"    # Ljava/lang/String;
    .param p3, "languagePreference"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    const-string v0, "en-US"

    iput-object v0, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->languagePreference:Ljava/lang/String;

    .line 51
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->debug:Ljava/lang/Boolean;

    .line 52
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->statusBarHidden:Ljava/lang/Boolean;

    .line 53
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->doNotDisturb:Ljava/lang/Boolean;

    .line 71
    invoke-virtual {p0, p1}, Lcom/disney/id/android/DIDSessionConfigInstance;->setEnv(Ljava/lang/String;)Lcom/disney/id/android/DIDSessionConfigInstance;

    .line 72
    invoke-virtual {p0, p2}, Lcom/disney/id/android/DIDSessionConfigInstance;->setClientId(Ljava/lang/String;)Lcom/disney/id/android/DIDSessionConfigInstance;

    .line 73
    invoke-virtual {p0, p3}, Lcom/disney/id/android/DIDSessionConfigInstance;->setLanguagePreference(Ljava/lang/String;)Lcom/disney/id/android/DIDSessionConfigInstance;

    .line 74
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "env"    # Ljava/lang/String;
    .param p2, "clientId"    # Ljava/lang/String;
    .param p3, "languagePreference"    # Ljava/lang/String;
    .param p4, "cssOverrideUrl"    # Ljava/lang/String;

    .prologue
    .line 77
    invoke-direct {p0, p1, p2, p3}, Lcom/disney/id/android/DIDSessionConfigInstance;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    invoke-virtual {p0, p4}, Lcom/disney/id/android/DIDSessionConfigInstance;->setCssOverrideUrl(Ljava/lang/String;)Lcom/disney/id/android/DIDSessionConfigInstance;

    .line 79
    return-void
.end method

.method private static ajc$preClinit()V
    .locals 9

    .prologue
    .line 1
    new-instance v0, Lorg/aspectj/runtime/reflect/Factory;

    const-string v1, "DIDSessionConfigInstance.java"

    const-class v2, Lcom/disney/id/android/DIDSessionConfigInstance;

    invoke-direct {v0, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    const-string v8, "method-execution"

    const-string v1, "0"

    const-string v2, "getLightBoxBaseUrl"

    const-string v3, "com.disney.id.android.DIDSessionConfigInstance"

    const-string v4, ""

    const-string v5, ""

    const-string v6, ""

    const-string v7, "java.lang.String"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x108

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/DIDSessionConfigInstance;->ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "0"

    const-string v2, "getGuestControllerBaseUrl"

    const-string v3, "com.disney.id.android.DIDSessionConfigInstance"

    const-string v4, ""

    const-string v5, ""

    const-string v6, ""

    const-string v7, "java.lang.String"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x130

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/DIDSessionConfigInstance;->ajc$tjp_1:Lorg/aspectj/lang/JoinPoint$StaticPart;

    return-void
.end method

.method private static final getGuestControllerBaseUrl_aroundBody2(Lcom/disney/id/android/DIDSessionConfigInstance;Lorg/aspectj/lang/JoinPoint;)Ljava/lang/String;
    .locals 5
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSessionConfigInstance;

    .prologue
    .line 304
    invoke-direct {p0}, Lcom/disney/id/android/DIDSessionConfigInstance;->validateConfigs()V

    .line 306
    sget-object v2, Lcom/disney/id/android/DIDSessionConfigInstance;->ENVIRONMENT_CONFIGURATIONS:Ljava/util/Map;

    iget-object v3, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->env:Ljava/lang/String;

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/disney/id/android/EnvironmentInformation;

    .line 308
    .local v0, "currentEnvironment":Lcom/disney/id/android/EnvironmentInformation;
    invoke-virtual {v0}, Lcom/disney/id/android/EnvironmentInformation;->getGuestControllerBaseURL()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v2

    const-string v3, "jgc"

    invoke-virtual {v2, v3}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v2

    const-string v3, "v2"

    invoke-virtual {v2, v3}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v2

    const-string v3, "client"

    invoke-virtual {v2, v3}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->clientId:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x2d

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lcom/disney/id/android/EnvironmentInformation;->getCoreServicesEnvironment()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    .line 315
    .local v1, "guestControllerUrlBuilder":Landroid/net/Uri$Builder;
    invoke-virtual {v1}, Landroid/net/Uri$Builder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private static final getGuestControllerBaseUrl_aroundBody3$advice(Lcom/disney/id/android/DIDSessionConfigInstance;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSessionConfigInstance;
    .param p1, "thisJoinPoint"    # Lorg/aspectj/lang/JoinPoint;
    .param p2, "ajc$aspectInstance"    # Lcom/disney/id/android/gintonic/aspect/TraceAspect;
    .param p3, "joinPoint"    # Lorg/aspectj/lang/ProceedingJoinPoint;

    .prologue
    .line 36
    invoke-interface {p3}, Lorg/aspectj/lang/ProceedingJoinPoint;->getSignature()Lorg/aspectj/lang/Signature;

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
    invoke-static {p0, p3}, Lcom/disney/id/android/DIDSessionConfigInstance;->getGuestControllerBaseUrl_aroundBody2(Lcom/disney/id/android/DIDSessionConfigInstance;Lorg/aspectj/lang/JoinPoint;)Ljava/lang/String;

    move-result-object v3

    .line 43
    .local v3, "result":Ljava/lang/String;
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

.method private static final getLightBoxBaseUrl_aroundBody0(Lcom/disney/id/android/DIDSessionConfigInstance;Lorg/aspectj/lang/JoinPoint;)Ljava/lang/String;
    .locals 6
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSessionConfigInstance;

    .prologue
    .line 264
    invoke-direct {p0}, Lcom/disney/id/android/DIDSessionConfigInstance;->validateConfigs()V

    .line 266
    sget-object v3, Lcom/disney/id/android/DIDSessionConfigInstance;->ENVIRONMENT_CONFIGURATIONS:Ljava/util/Map;

    iget-object v4, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->env:Ljava/lang/String;

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/disney/id/android/EnvironmentInformation;

    .line 268
    .local v0, "currentEnvironment":Lcom/disney/id/android/EnvironmentInformation;
    invoke-virtual {v0}, Lcom/disney/id/android/EnvironmentInformation;->getLightBoxBaseURL()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v3}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v3

    const-string v4, "v2"

    invoke-virtual {v3, v4}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->clientId:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x2d

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lcom/disney/id/android/EnvironmentInformation;->getCoreServicesEnvironment()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v4

    iget-object v3, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->languagePreference:Ljava/lang/String;

    invoke-static {v3}, Lcom/disney/id/android/DIDUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    const-string v3, "en-US"

    :goto_0
    invoke-virtual {v4, v3}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v3

    const-string v4, "client"

    const-string v5, "android"

    invoke-virtual {v3, v4, v5}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v3

    const-string v4, "include"

    const-string v5, "l10n,config,html,js"

    invoke-virtual {v3, v4, v5}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v3

    const-string v4, "config"

    invoke-virtual {v0}, Lcom/disney/id/android/EnvironmentInformation;->getLightBoxConfigEnvironment()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v3

    const-string v4, "content"

    invoke-virtual {v0}, Lcom/disney/id/android/EnvironmentInformation;->getLightBoxContentEnvironment()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v3

    const-string v4, "l10n"

    invoke-virtual {v0}, Lcom/disney/id/android/EnvironmentInformation;->getLightBoxLocalizationEnvironment()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v3

    const-string v4, "ui"

    const-string v5, "mobile"

    invoke-virtual {v3, v4, v5}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v3

    const-string v4, "version"

    const-string v5, "3.1.4"

    invoke-virtual {v3, v4, v5}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    .line 282
    .local v1, "lightBoxUrlBuilder":Landroid/net/Uri$Builder;
    iget-object v3, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->cssOverrideUrl:Ljava/lang/String;

    invoke-static {v3}, Lcom/disney/id/android/DIDUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 283
    const-string v3, "cssOverride"

    iget-object v4, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->cssOverrideUrl:Ljava/lang/String;

    invoke-virtual {v1, v3, v4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 286
    :cond_0
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v3

    invoke-virtual {v3}, Lcom/disney/id/android/DIDGuest;->hasGuest()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v3

    invoke-virtual {v3}, Lcom/disney/id/android/DIDGuest;->hasProfile()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 287
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v3

    invoke-virtual {v3}, Lcom/disney/id/android/DIDGuest;->getProfile()Lcom/disney/id/android/DIDProfile;

    move-result-object v2

    .line 288
    .local v2, "profile":Lcom/disney/id/android/DIDProfile;
    invoke-virtual {v2}, Lcom/disney/id/android/DIDProfile;->hasAgeBand()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 289
    const-string v3, "ageBand"

    invoke-virtual {v2}, Lcom/disney/id/android/DIDProfile;->getAgeBand()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 290
    :cond_1
    invoke-virtual {v2}, Lcom/disney/id/android/DIDProfile;->hasCountryCodeDetected()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 291
    const-string v3, "countryCode"

    invoke-virtual {v2}, Lcom/disney/id/android/DIDProfile;->getCountryCodeDetected()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 294
    .end local v2    # "profile":Lcom/disney/id/android/DIDProfile;
    :cond_2
    invoke-virtual {v1}, Landroid/net/Uri$Builder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 268
    .end local v1    # "lightBoxUrlBuilder":Landroid/net/Uri$Builder;
    :cond_3
    iget-object v3, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->languagePreference:Ljava/lang/String;

    goto/16 :goto_0
.end method

.method private static final getLightBoxBaseUrl_aroundBody1$advice(Lcom/disney/id/android/DIDSessionConfigInstance;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSessionConfigInstance;
    .param p1, "thisJoinPoint"    # Lorg/aspectj/lang/JoinPoint;
    .param p2, "ajc$aspectInstance"    # Lcom/disney/id/android/gintonic/aspect/TraceAspect;
    .param p3, "joinPoint"    # Lorg/aspectj/lang/ProceedingJoinPoint;

    .prologue
    .line 36
    invoke-interface {p3}, Lorg/aspectj/lang/ProceedingJoinPoint;->getSignature()Lorg/aspectj/lang/Signature;

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
    invoke-static {p0, p3}, Lcom/disney/id/android/DIDSessionConfigInstance;->getLightBoxBaseUrl_aroundBody0(Lcom/disney/id/android/DIDSessionConfigInstance;Lorg/aspectj/lang/JoinPoint;)Ljava/lang/String;

    move-result-object v3

    .line 43
    .local v3, "result":Ljava/lang/String;
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

.method private static validateConfig(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 324
    invoke-static {p1}, Lcom/disney/id/android/DIDUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 325
    new-instance v1, Lcom/disney/id/android/DIDException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " was improperly configured: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    if-nez p1, :cond_0

    const-string v0, "found null"

    :goto_0
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/disney/id/android/DIDException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_0
    const-string v0, "found zero-length"

    goto :goto_0

    .line 330
    :cond_1
    return-void
.end method

.method private validateConfigs()V
    .locals 2

    .prologue
    .line 319
    const-string v0, "did_env"

    iget-object v1, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->env:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDSessionConfigInstance;->validateConfig(Ljava/lang/String;Ljava/lang/String;)V

    .line 320
    const-string v0, "did_client_id"

    iget-object v1, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->clientId:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDSessionConfigInstance;->validateConfig(Ljava/lang/String;Ljava/lang/String;)V

    .line 321
    return-void
.end method

.method private validateEnv(Ljava/lang/String;)Z
    .locals 1
    .param p1, "env"    # Ljava/lang/String;

    .prologue
    .line 114
    const-string v0, "prod"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "dark"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "stg"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "stg.dark"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "qa"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "dev"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private validateLanguagePreference(Ljava/lang/String;)Z
    .locals 1
    .param p1, "languagePreference"    # Ljava/lang/String;

    .prologue
    .line 155
    const-string v0, "^[a-z]{2}-[A-Z]{2}$"

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public getCanUseSiteRequest()Lcom/disney/id/android/DIDRequest;
    .locals 1

    .prologue
    .line 217
    iget-object v0, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->canUseSiteRequest:Lcom/disney/id/android/DIDRequest;

    return-object v0
.end method

.method public getClientId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 135
    iget-object v0, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->clientId:Ljava/lang/String;

    return-object v0
.end method

.method public getCoreServicesEnv()Ljava/lang/String;
    .locals 2

    .prologue
    .line 333
    sget-object v0, Lcom/disney/id/android/DIDSessionConfigInstance;->ENVIRONMENT_CONFIGURATIONS:Ljava/util/Map;

    iget-object v1, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->env:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/disney/id/android/EnvironmentInformation;

    invoke-virtual {v0}, Lcom/disney/id/android/EnvironmentInformation;->getCoreServicesEnvironment()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCountryPreference()Ljava/lang/String;
    .locals 1

    .prologue
    .line 177
    iget-object v0, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->countryPreference:Ljava/lang/String;

    return-object v0
.end method

.method public getCssOverrideUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 168
    iget-object v0, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->cssOverrideUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getDebug()Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 190
    iget-object v0, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->debug:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getDoNotDisturb()Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 208
    iget-object v0, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->doNotDisturb:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getEnv()Ljava/lang/String;
    .locals 1

    .prologue
    .line 123
    iget-object v0, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->env:Ljava/lang/String;

    return-object v0
.end method

.method getGuestControllerBaseUrl()Ljava/lang/String;
    .locals 3
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDSessionConfigInstance;->ajc$tjp_1:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, v1, v2, v0}, Lcom/disney/id/android/DIDSessionConfigInstance;->getGuestControllerBaseUrl_aroundBody3$advice(Lcom/disney/id/android/DIDSessionConfigInstance;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getLanguagePreference()Ljava/lang/String;
    .locals 1

    .prologue
    .line 159
    iget-object v0, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->languagePreference:Ljava/lang/String;

    return-object v0
.end method

.method getLightBoxBaseUrl()Ljava/lang/String;
    .locals 3
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDSessionConfigInstance;->ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, v1, v2, v0}, Lcom/disney/id/android/DIDSessionConfigInstance;->getLightBoxBaseUrl_aroundBody1$advice(Lcom/disney/id/android/DIDSessionConfigInstance;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public isStatusBarHidden()Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 199
    iget-object v0, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->statusBarHidden:Ljava/lang/Boolean;

    return-object v0
.end method

.method public mergeMetaData(Landroid/content/Context;)Lcom/disney/id/android/DIDSessionConfigInstance;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 223
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/disney/id/android/DIDSessionConfigUtils;->getApplicationMetaData(Landroid/content/Context;)Landroid/os/Bundle;

    move-result-object v0

    .line 224
    .local v0, "metaData":Landroid/os/Bundle;
    if-nez v0, :cond_1

    .line 225
    sget-object v1, Lcom/disney/id/android/DIDSessionConfigInstance;->TAG:Ljava/lang/String;

    invoke-static {v1}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "No meta-data was found in the AndroidManifest.xml file."

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 254
    :cond_0
    :goto_0
    return-object p0

    .line 229
    :cond_1
    iget-object v1, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->env:Ljava/lang/String;

    invoke-static {v1}, Lcom/disney/id/android/DIDUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 230
    const-string v1, "did_env"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/disney/id/android/DIDSessionConfigInstance;->setEnv(Ljava/lang/String;)Lcom/disney/id/android/DIDSessionConfigInstance;

    .line 232
    :cond_2
    iget-object v1, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->clientId:Ljava/lang/String;

    invoke-static {v1}, Lcom/disney/id/android/DIDUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 233
    const-string v1, "did_client_id"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/disney/id/android/DIDSessionConfigInstance;->setClientId(Ljava/lang/String;)Lcom/disney/id/android/DIDSessionConfigInstance;

    .line 235
    :cond_3
    iget-object v1, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->languagePreference:Ljava/lang/String;

    invoke-static {v1}, Lcom/disney/id/android/DIDUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 236
    const-string v1, "did_lang_pref"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/disney/id/android/DIDSessionConfigInstance;->setLanguagePreference(Ljava/lang/String;)Lcom/disney/id/android/DIDSessionConfigInstance;

    .line 238
    :cond_4
    iget-object v1, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->cssOverrideUrl:Ljava/lang/String;

    invoke-static {v1}, Lcom/disney/id/android/DIDUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 239
    const-string v1, "did_css_override_url"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/disney/id/android/DIDSessionConfigInstance;->setCssOverrideUrl(Ljava/lang/String;)Lcom/disney/id/android/DIDSessionConfigInstance;

    .line 241
    :cond_5
    iget-object v1, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->countryPreference:Ljava/lang/String;

    invoke-static {v1}, Lcom/disney/id/android/DIDUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 242
    const-string v1, "did_country_pref"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/disney/id/android/DIDSessionConfigInstance;->setCountryPreference(Ljava/lang/String;)Lcom/disney/id/android/DIDSessionConfigInstance;

    .line 244
    :cond_6
    iget-object v1, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->debug:Ljava/lang/Boolean;

    if-nez v1, :cond_7

    .line 245
    const-string v1, "did_debug"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/disney/id/android/DIDSessionConfigInstance;->setDebug(Ljava/lang/Boolean;)Lcom/disney/id/android/DIDSessionConfigInstance;

    .line 247
    :cond_7
    iget-object v1, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->statusBarHidden:Ljava/lang/Boolean;

    if-nez v1, :cond_8

    .line 248
    const-string v1, "did_hide_status_bar"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/disney/id/android/DIDSessionConfigInstance;->setStatusBarHidden(Ljava/lang/Boolean;)Lcom/disney/id/android/DIDSessionConfigInstance;

    .line 250
    :cond_8
    iget-object v1, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->doNotDisturb:Ljava/lang/Boolean;

    if-nez v1, :cond_0

    .line 251
    const-string v1, "did_do_not_disturb"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/disney/id/android/DIDSessionConfigInstance;->setDoNotDisturb(Ljava/lang/Boolean;)Lcom/disney/id/android/DIDSessionConfigInstance;

    goto/16 :goto_0
.end method

.method setCanUseSiteRequest(Lcom/disney/id/android/DIDRequest;)Lcom/disney/id/android/DIDSessionConfigInstance;
    .locals 0
    .param p1, "canUseSiteRequest"    # Lcom/disney/id/android/DIDRequest;

    .prologue
    .line 212
    iput-object p1, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->canUseSiteRequest:Lcom/disney/id/android/DIDRequest;

    .line 213
    return-object p0
.end method

.method public setClientId(Ljava/lang/String;)Lcom/disney/id/android/DIDSessionConfigInstance;
    .locals 1
    .param p1, "clientId"    # Ljava/lang/String;

    .prologue
    .line 127
    if-eqz p1, :cond_0

    .line 128
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    .line 130
    :cond_0
    iput-object p1, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->clientId:Ljava/lang/String;

    .line 131
    return-object p0
.end method

.method public setCountryPreference(Ljava/lang/String;)Lcom/disney/id/android/DIDSessionConfigInstance;
    .locals 0
    .param p1, "countryPreference"    # Ljava/lang/String;

    .prologue
    .line 172
    iput-object p1, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->countryPreference:Ljava/lang/String;

    .line 173
    return-object p0
.end method

.method public setCssOverrideUrl(Ljava/lang/String;)Lcom/disney/id/android/DIDSessionConfigInstance;
    .locals 0
    .param p1, "cssOverrideUrl"    # Ljava/lang/String;

    .prologue
    .line 163
    iput-object p1, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->cssOverrideUrl:Ljava/lang/String;

    .line 164
    return-object p0
.end method

.method public setDebug(Ljava/lang/Boolean;)Lcom/disney/id/android/DIDSessionConfigInstance;
    .locals 2
    .param p1, "debug"    # Ljava/lang/Boolean;

    .prologue
    .line 181
    sget-object v0, Lcom/disney/id/android/DIDSessionConfigInstance;->ENVIRONMENT_CONFIGURATIONS:Ljava/util/Map;

    iget-object v1, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->env:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/disney/id/android/EnvironmentInformation;

    invoke-virtual {v0}, Lcom/disney/id/android/EnvironmentInformation;->isDebugAllowedInEnvironment()Z

    move-result v0

    if-nez v0, :cond_0

    .line 182
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->debug:Ljava/lang/Boolean;

    .line 186
    :goto_0
    return-object p0

    .line 184
    :cond_0
    iput-object p1, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->debug:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method setDoNotDisturb(Ljava/lang/Boolean;)Lcom/disney/id/android/DIDSessionConfigInstance;
    .locals 0
    .param p1, "doNotDisturb"    # Ljava/lang/Boolean;

    .prologue
    .line 203
    iput-object p1, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->doNotDisturb:Ljava/lang/Boolean;

    .line 204
    return-object p0
.end method

.method public setEnv(Ljava/lang/String;)Lcom/disney/id/android/DIDSessionConfigInstance;
    .locals 3
    .param p1, "env"    # Ljava/lang/String;

    .prologue
    .line 101
    if-eqz p1, :cond_1

    .line 102
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    .line 103
    invoke-direct {p0, p1}, Lcom/disney/id/android/DIDSessionConfigInstance;->validateEnv(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 104
    new-instance v0, Lcom/disney/id/android/DIDException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "did_env was improperly configured: found \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\', expected one of: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "prod"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "dark"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "stg"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "stg.dark"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "qa"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "dev"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/disney/id/android/DIDException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 108
    :cond_0
    iput-object p1, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->env:Ljava/lang/String;

    .line 110
    :cond_1
    return-object p0
.end method

.method public setLanguagePreference(Ljava/lang/String;)Lcom/disney/id/android/DIDSessionConfigInstance;
    .locals 2
    .param p1, "languagePreference"    # Ljava/lang/String;

    .prologue
    .line 139
    invoke-static {p1}, Lcom/disney/id/android/DIDUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 140
    invoke-direct {p0, p1}, Lcom/disney/id/android/DIDSessionConfigInstance;->validateLanguagePreference(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 141
    iput-object p1, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->languagePreference:Ljava/lang/String;

    .line 143
    invoke-static {}, Lcom/disney/id/android/localization/DIDLocalizationManager;->getInstance()Lcom/disney/id/android/localization/DIDLocalizationManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/localization/DIDLocalizationManager;->load()V

    .line 151
    :goto_0
    return-object p0

    .line 145
    :cond_0
    sget-object v0, Lcom/disney/id/android/DIDSessionConfigInstance;->TAG:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Language preference invalid format"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 148
    :cond_1
    const-string v0, "en-US"

    iput-object v0, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->languagePreference:Ljava/lang/String;

    .line 149
    invoke-static {}, Lcom/disney/id/android/localization/DIDLocalizationManager;->getInstance()Lcom/disney/id/android/localization/DIDLocalizationManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/localization/DIDLocalizationManager;->load()V

    goto :goto_0
.end method

.method public setStatusBarHidden(Ljava/lang/Boolean;)Lcom/disney/id/android/DIDSessionConfigInstance;
    .locals 0
    .param p1, "statusBarHidden"    # Ljava/lang/Boolean;

    .prologue
    .line 194
    iput-object p1, p0, Lcom/disney/id/android/DIDSessionConfigInstance;->statusBarHidden:Ljava/lang/Boolean;

    .line 195
    return-object p0
.end method
