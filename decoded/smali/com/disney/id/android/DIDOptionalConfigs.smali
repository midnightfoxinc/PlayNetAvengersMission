.class public Lcom/disney/id/android/DIDOptionalConfigs;
.super Ljava/lang/Object;
.source "DIDOptionalConfigs.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/disney/id/android/DIDOptionalConfigs$1;,
        Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;
    }
.end annotation


# static fields
.field private static final NULL_CONFIGS:Lcom/disney/id/android/DIDOptionalConfigs;


# instance fields
.field private final affiliateName:Ljava/lang/String;

.field private final providedProfile:Lorg/json/JSONObject;

.field private final siteID:Ljava/lang/String;

.field private final sourceName:Ljava/lang/String;

.field private final templateName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 13
    new-instance v0, Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;

    invoke-direct {v0}, Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;->build()Lcom/disney/id/android/DIDOptionalConfigs;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/DIDOptionalConfigs;->NULL_CONFIGS:Lcom/disney/id/android/DIDOptionalConfigs;

    return-void
.end method

.method private constructor <init>(Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;)V
    .locals 1
    .param p1, "builder"    # Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;

    .prologue
    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    invoke-static {p1}, Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;->access$000(Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/id/android/DIDOptionalConfigs;->sourceName:Ljava/lang/String;

    .line 71
    invoke-static {p1}, Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;->access$100(Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/id/android/DIDOptionalConfigs;->siteID:Ljava/lang/String;

    .line 72
    invoke-static {p1}, Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;->access$200(Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/id/android/DIDOptionalConfigs;->affiliateName:Ljava/lang/String;

    .line 73
    invoke-static {p1}, Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;->access$300(Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/id/android/DIDOptionalConfigs;->templateName:Ljava/lang/String;

    .line 74
    invoke-static {p1}, Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;->access$400(Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;)Lorg/json/JSONObject;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/id/android/DIDOptionalConfigs;->providedProfile:Lorg/json/JSONObject;

    .line 75
    return-void
.end method

.method synthetic constructor <init>(Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;Lcom/disney/id/android/DIDOptionalConfigs$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;
    .param p2, "x1"    # Lcom/disney/id/android/DIDOptionalConfigs$1;

    .prologue
    .line 11
    invoke-direct {p0, p1}, Lcom/disney/id/android/DIDOptionalConfigs;-><init>(Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;)V

    return-void
.end method


# virtual methods
.method public getAffiliateName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lcom/disney/id/android/DIDOptionalConfigs;->affiliateName:Ljava/lang/String;

    return-object v0
.end method

.method public getProvidedProfile()Lorg/json/JSONObject;
    .locals 1

    .prologue
    .line 40
    iget-object v0, p0, Lcom/disney/id/android/DIDOptionalConfigs;->providedProfile:Lorg/json/JSONObject;

    return-object v0
.end method

.method public getSiteID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lcom/disney/id/android/DIDOptionalConfigs;->siteID:Ljava/lang/String;

    return-object v0
.end method

.method public getSourceName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 24
    iget-object v0, p0, Lcom/disney/id/android/DIDOptionalConfigs;->sourceName:Ljava/lang/String;

    return-object v0
.end method

.method public getTemplateName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/disney/id/android/DIDOptionalConfigs;->templateName:Ljava/lang/String;

    return-object v0
.end method

.method toJSON()Lorg/json/JSONObject;
    .locals 4

    .prologue
    .line 44
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 47
    .local v1, "json":Lorg/json/JSONObject;
    :try_start_0
    iget-object v2, p0, Lcom/disney/id/android/DIDOptionalConfigs;->sourceName:Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 48
    const-string v2, "sourceName"

    iget-object v3, p0, Lcom/disney/id/android/DIDOptionalConfigs;->sourceName:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 50
    :cond_0
    iget-object v2, p0, Lcom/disney/id/android/DIDOptionalConfigs;->siteID:Ljava/lang/String;

    if-eqz v2, :cond_1

    .line 51
    const-string v2, "siteID"

    iget-object v3, p0, Lcom/disney/id/android/DIDOptionalConfigs;->siteID:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 53
    :cond_1
    iget-object v2, p0, Lcom/disney/id/android/DIDOptionalConfigs;->affiliateName:Ljava/lang/String;

    if-eqz v2, :cond_2

    .line 54
    const-string v2, "affiliateName"

    iget-object v3, p0, Lcom/disney/id/android/DIDOptionalConfigs;->affiliateName:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 56
    :cond_2
    iget-object v2, p0, Lcom/disney/id/android/DIDOptionalConfigs;->templateName:Ljava/lang/String;

    if-eqz v2, :cond_3

    .line 57
    const-string v2, "templateName"

    iget-object v3, p0, Lcom/disney/id/android/DIDOptionalConfigs;->templateName:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 59
    :cond_3
    iget-object v2, p0, Lcom/disney/id/android/DIDOptionalConfigs;->providedProfile:Lorg/json/JSONObject;

    if-eqz v2, :cond_4

    .line 60
    const-string v2, "providedProfile"

    iget-object v3, p0, Lcom/disney/id/android/DIDOptionalConfigs;->providedProfile:Lorg/json/JSONObject;

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 66
    :cond_4
    :goto_0
    return-object v1

    .line 62
    :catch_0
    move-exception v0

    .line 63
    .local v0, "e":Lorg/json/JSONException;
    const-class v2, Lcom/disney/id/android/DIDOptionalConfigs;

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Something went wrong in the toJSON() method"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
