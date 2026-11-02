.class Lcom/disney/id/android/EnvironmentInformation;
.super Ljava/lang/Object;
.source "EnvironmentInformation.java"


# static fields
.field private static final BASE_URL_KEY:Ljava/lang/String; = "baseURL"

.field private static final CONFIG_ENVIRONMENT_KEY:Ljava/lang/String; = "configEnvironment"

.field private static final CONTENT_ENVIRONMENT_KEY:Ljava/lang/String; = "contentEnvironment"

.field private static final CORE_SERVICES_ENVIRONMENT_KEY:Ljava/lang/String; = "coreServicesEnvironment"

.field private static final CSS_POSTFIX_MAPPING_KEY:Ljava/lang/String; = "cssPostfixMapping"

.field private static final DEBUG_ALLOWED_KEY:Ljava/lang/String; = "debugAllowed"

.field private static final GUEST_CONTROLLER_CONFIG_KEY:Ljava/lang/String; = "guestControllerConfig"

.field private static final LIGHT_BOX_CONFIG_KEY:Ljava/lang/String; = "lightBoxConfig"

.field private static final LOCALIZATION_ENVIRONMENT_KEY:Ljava/lang/String; = "localizationEnvironment"

.field private static final NAME_KEY:Ljava/lang/String; = "name"


# instance fields
.field private backingEnvironmentInformation:Lorg/json/JSONObject;


# direct methods
.method constructor <init>(Lorg/json/JSONObject;)V
    .locals 0
    .param p1, "backingEnvironmentInformation"    # Lorg/json/JSONObject;

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/disney/id/android/EnvironmentInformation;->backingEnvironmentInformation:Lorg/json/JSONObject;

    .line 24
    return-void
.end method


# virtual methods
.method getCSSPostfixMapping()Ljava/lang/String;
    .locals 2

    .prologue
    .line 35
    iget-object v0, p0, Lcom/disney/id/android/EnvironmentInformation;->backingEnvironmentInformation:Lorg/json/JSONObject;

    const-string v1, "cssPostfixMapping"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getCoreServicesEnvironment()Ljava/lang/String;
    .locals 2

    .prologue
    .line 39
    iget-object v0, p0, Lcom/disney/id/android/EnvironmentInformation;->backingEnvironmentInformation:Lorg/json/JSONObject;

    const-string v1, "coreServicesEnvironment"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getGuestControllerBaseURL()Ljava/lang/String;
    .locals 2

    .prologue
    .line 59
    iget-object v0, p0, Lcom/disney/id/android/EnvironmentInformation;->backingEnvironmentInformation:Lorg/json/JSONObject;

    const-string v1, "guestControllerConfig"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "baseURL"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getLightBoxBaseURL()Ljava/lang/String;
    .locals 2

    .prologue
    .line 43
    iget-object v0, p0, Lcom/disney/id/android/EnvironmentInformation;->backingEnvironmentInformation:Lorg/json/JSONObject;

    const-string v1, "lightBoxConfig"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "baseURL"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getLightBoxConfigEnvironment()Ljava/lang/String;
    .locals 2

    .prologue
    .line 47
    iget-object v0, p0, Lcom/disney/id/android/EnvironmentInformation;->backingEnvironmentInformation:Lorg/json/JSONObject;

    const-string v1, "lightBoxConfig"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "configEnvironment"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getLightBoxContentEnvironment()Ljava/lang/String;
    .locals 2

    .prologue
    .line 51
    iget-object v0, p0, Lcom/disney/id/android/EnvironmentInformation;->backingEnvironmentInformation:Lorg/json/JSONObject;

    const-string v1, "lightBoxConfig"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "contentEnvironment"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getLightBoxLocalizationEnvironment()Ljava/lang/String;
    .locals 2

    .prologue
    .line 55
    iget-object v0, p0, Lcom/disney/id/android/EnvironmentInformation;->backingEnvironmentInformation:Lorg/json/JSONObject;

    const-string v1, "lightBoxConfig"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "localizationEnvironment"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 27
    iget-object v0, p0, Lcom/disney/id/android/EnvironmentInformation;->backingEnvironmentInformation:Lorg/json/JSONObject;

    const-string v1, "name"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method isDebugAllowedInEnvironment()Z
    .locals 2

    .prologue
    .line 31
    iget-object v0, p0, Lcom/disney/id/android/EnvironmentInformation;->backingEnvironmentInformation:Lorg/json/JSONObject;

    const-string v1, "debugAllowed"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method
