.class final enum Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;
.super Ljava/lang/Enum;
.source "DIDLightBoxPageName.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

.field public static final enum CREATE_PROFILE:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

.field public static final enum FORGOT_PASSWORD:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

.field public static final enum FORGOT_USERNAME:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

.field public static final enum LOGIN:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

.field public static final enum NEWSLETTERS:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

.field public static final enum PPU:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

.field public static final enum READY:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

.field public static final enum REAUTH:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

.field public static final enum REQUEST_ACTIVITY:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

.field public static final enum SOCIAL_LOGIN_EXCEPTION_HANDLER:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

.field public static final enum SOCIAL_REGISTRATION:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

.field public static final enum UPDATE_DISPLAYNAME:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

.field public static final enum UPDATE_PROFILE:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;


# instance fields
.field private name:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 4
    new-instance v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    const-string v1, "LOGIN"

    const-string v2, "login"

    invoke-direct {v0, v1, v4, v2}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->LOGIN:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    .line 5
    new-instance v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    const-string v1, "REAUTH"

    const-string v2, "reauth"

    invoke-direct {v0, v1, v5, v2}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->REAUTH:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    .line 6
    new-instance v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    const-string v1, "FORGOT_USERNAME"

    const-string v2, "recoverUsername"

    invoke-direct {v0, v1, v6, v2}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->FORGOT_USERNAME:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    .line 7
    new-instance v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    const-string v1, "FORGOT_PASSWORD"

    const-string v2, "resetPassword"

    invoke-direct {v0, v1, v7, v2}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->FORGOT_PASSWORD:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    .line 8
    new-instance v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    const-string v1, "CREATE_PROFILE"

    const-string v2, "registration"

    invoke-direct {v0, v1, v8, v2}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->CREATE_PROFILE:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    .line 9
    new-instance v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    const-string v1, "UPDATE_PROFILE"

    const/4 v2, 0x5

    const-string v3, "profile"

    invoke-direct {v0, v1, v2, v3}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->UPDATE_PROFILE:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    .line 10
    new-instance v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    const-string v1, "UPDATE_DISPLAYNAME"

    const/4 v2, 0x6

    const-string v3, "displayName"

    invoke-direct {v0, v1, v2, v3}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->UPDATE_DISPLAYNAME:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    .line 11
    new-instance v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    const-string v1, "SOCIAL_REGISTRATION"

    const/4 v2, 0x7

    const-string v3, "socialRegistration"

    invoke-direct {v0, v1, v2, v3}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->SOCIAL_REGISTRATION:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    .line 12
    new-instance v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    const-string v1, "SOCIAL_LOGIN_EXCEPTION_HANDLER"

    const/16 v2, 0x8

    const-string v3, "socialLoginExceptionHandler"

    invoke-direct {v0, v1, v2, v3}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->SOCIAL_LOGIN_EXCEPTION_HANDLER:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    .line 13
    new-instance v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    const-string v1, "PPU"

    const/16 v2, 0x9

    const-string v3, "ppu"

    invoke-direct {v0, v1, v2, v3}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->PPU:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    .line 14
    new-instance v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    const-string v1, "NEWSLETTERS"

    const/16 v2, 0xa

    const-string v3, "newsletters"

    invoke-direct {v0, v1, v2, v3}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->NEWSLETTERS:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    .line 15
    new-instance v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    const-string v1, "READY"

    const/16 v2, 0xb

    const-string v3, "ready"

    invoke-direct {v0, v1, v2, v3}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->READY:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    .line 16
    new-instance v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    const-string v1, "REQUEST_ACTIVITY"

    const/16 v2, 0xc

    const-string v3, "requestActivity"

    invoke-direct {v0, v1, v2, v3}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->REQUEST_ACTIVITY:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    .line 3
    const/16 v0, 0xd

    new-array v0, v0, [Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    sget-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->LOGIN:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    aput-object v1, v0, v4

    sget-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->REAUTH:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    aput-object v1, v0, v5

    sget-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->FORGOT_USERNAME:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    aput-object v1, v0, v6

    sget-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->FORGOT_PASSWORD:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    aput-object v1, v0, v7

    sget-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->CREATE_PROFILE:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->UPDATE_PROFILE:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->UPDATE_DISPLAYNAME:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->SOCIAL_REGISTRATION:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->SOCIAL_LOGIN_EXCEPTION_HANDLER:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->PPU:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->NEWSLETTERS:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->READY:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->REQUEST_ACTIVITY:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    aput-object v2, v0, v1

    sput-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->$VALUES:[Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .param p3, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 20
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 21
    iput-object p3, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->name:Ljava/lang/String;

    .line 22
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 3
    const-class v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    return-object v0
.end method

.method public static values()[Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;
    .locals 1

    .prologue
    .line 3
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->$VALUES:[Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    invoke-virtual {v0}, [Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    return-object v0
.end method


# virtual methods
.method getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 25
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->name:Ljava/lang/String;

    return-object v0
.end method
