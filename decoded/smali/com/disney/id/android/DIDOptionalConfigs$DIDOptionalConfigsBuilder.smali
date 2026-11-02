.class public Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;
.super Ljava/lang/Object;
.source "DIDOptionalConfigs.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disney/id/android/DIDOptionalConfigs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DIDOptionalConfigsBuilder"
.end annotation


# instance fields
.field private affiliateName:Ljava/lang/String;

.field private providedProfile:Lorg/json/JSONObject;

.field private siteID:Ljava/lang/String;

.field private sourceName:Ljava/lang/String;

.field private templateName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;

    .prologue
    .line 77
    iget-object v0, p0, Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;->sourceName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;

    .prologue
    .line 77
    iget-object v0, p0, Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;->siteID:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;

    .prologue
    .line 77
    iget-object v0, p0, Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;->affiliateName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;

    .prologue
    .line 77
    iget-object v0, p0, Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;->templateName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;)Lorg/json/JSONObject;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;

    .prologue
    .line 77
    iget-object v0, p0, Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;->providedProfile:Lorg/json/JSONObject;

    return-object v0
.end method


# virtual methods
.method public affiliateName(Ljava/lang/String;)Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;
    .locals 0
    .param p1, "affiliateName"    # Ljava/lang/String;

    .prologue
    .line 97
    iput-object p1, p0, Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;->affiliateName:Ljava/lang/String;

    .line 99
    return-object p0
.end method

.method public build()Lcom/disney/id/android/DIDOptionalConfigs;
    .locals 2

    .prologue
    .line 115
    new-instance v0, Lcom/disney/id/android/DIDOptionalConfigs;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/disney/id/android/DIDOptionalConfigs;-><init>(Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;Lcom/disney/id/android/DIDOptionalConfigs$1;)V

    return-object v0
.end method

.method public providedProfile(Lorg/json/JSONObject;)Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;
    .locals 0
    .param p1, "providedProfile"    # Lorg/json/JSONObject;

    .prologue
    .line 109
    iput-object p1, p0, Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;->providedProfile:Lorg/json/JSONObject;

    .line 111
    return-object p0
.end method

.method public siteID(Ljava/lang/String;)Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;
    .locals 0
    .param p1, "siteID"    # Ljava/lang/String;

    .prologue
    .line 91
    iput-object p1, p0, Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;->siteID:Ljava/lang/String;

    .line 93
    return-object p0
.end method

.method public sourceName(Ljava/lang/String;)Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;
    .locals 0
    .param p1, "sourceName"    # Ljava/lang/String;

    .prologue
    .line 85
    iput-object p1, p0, Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;->sourceName:Ljava/lang/String;

    .line 87
    return-object p0
.end method

.method public templateName(Ljava/lang/String;)Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;
    .locals 0
    .param p1, "templateName"    # Ljava/lang/String;

    .prologue
    .line 103
    iput-object p1, p0, Lcom/disney/id/android/DIDOptionalConfigs$DIDOptionalConfigsBuilder;->templateName:Ljava/lang/String;

    .line 105
    return-object p0
.end method
