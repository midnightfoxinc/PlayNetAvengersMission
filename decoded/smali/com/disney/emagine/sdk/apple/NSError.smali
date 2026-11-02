.class public Lcom/disney/emagine/sdk/apple/NSError;
.super Ljava/lang/Object;
.source "NSError.java"


# static fields
.field public static final EMAGINE_DOMAIN:Ljava/lang/String; = "com.disney.eMagine"

.field public static final EMAGINE_ERROR_CRC:I = 0x8

.field public static final EMAGINE_ERROR_DISCONNECTED:I = 0x2

.field public static final EMAGINE_ERROR_DUPLICATE:I = 0x5

.field public static final EMAGINE_ERROR_EMPTY_FILE:I = 0xa

.field public static final EMAGINE_ERROR_INVALID:I = 0x6

.field public static final EMAGINE_ERROR_NO_BLE:I = 0x1

.field public static final EMAGINE_ERROR_RESET_TRANSFER:I = 0xc

.field public static final EMAGINE_ERROR_RESPONSE:I = 0x7

.field public static final EMAGINE_ERROR_SEQUENCE:I = 0x3

.field public static final EMAGINE_ERROR_TIMEOUT:I = 0xb

.field public static final EMAGINE_ERROR_TRANSFER:I = 0x9

.field public static final EMAGINE_ERROR_UNPACK:I = 0x4


# instance fields
.field private mCode:I

.field private mDomain:Ljava/lang/String;

.field private mUserInfo:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .locals 1
    .param p1, "domain"    # Ljava/lang/String;
    .param p2, "code"    # I

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    const/4 v0, 0x0

    iput v0, p0, Lcom/disney/emagine/sdk/apple/NSError;->mCode:I

    .line 44
    iput-object p1, p0, Lcom/disney/emagine/sdk/apple/NSError;->mDomain:Ljava/lang/String;

    .line 45
    iput p2, p0, Lcom/disney/emagine/sdk/apple/NSError;->mCode:I

    .line 46
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 1
    .param p1, "domain"    # Ljava/lang/String;
    .param p2, "code"    # I
    .param p3, "userInfo"    # Ljava/lang/String;

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    const/4 v0, 0x0

    iput v0, p0, Lcom/disney/emagine/sdk/apple/NSError;->mCode:I

    .line 37
    iput-object p1, p0, Lcom/disney/emagine/sdk/apple/NSError;->mDomain:Ljava/lang/String;

    .line 38
    iput p2, p0, Lcom/disney/emagine/sdk/apple/NSError;->mCode:I

    .line 39
    iput-object p3, p0, Lcom/disney/emagine/sdk/apple/NSError;->mUserInfo:Ljava/lang/String;

    .line 40
    return-void
.end method


# virtual methods
.method public code()I
    .locals 1

    .prologue
    .line 65
    iget v0, p0, Lcom/disney/emagine/sdk/apple/NSError;->mCode:I

    return v0
.end method

.method public description()Ljava/lang/String;
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Lcom/disney/emagine/sdk/apple/NSError;->mUserInfo:Ljava/lang/String;

    return-object v0
.end method

.method public domain()Ljava/lang/String;
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/disney/emagine/sdk/apple/NSError;->mDomain:Ljava/lang/String;

    return-object v0
.end method

.method public localizedDescription()Ljava/lang/String;
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lcom/disney/emagine/sdk/apple/NSError;->mUserInfo:Ljava/lang/String;

    return-object v0
.end method

.method public setCode(I)V
    .locals 0
    .param p1, "mCode"    # I

    .prologue
    .line 60
    iput p1, p0, Lcom/disney/emagine/sdk/apple/NSError;->mCode:I

    .line 61
    return-void
.end method

.method public setDomain(Ljava/lang/String;)V
    .locals 0
    .param p1, "mDomain"    # Ljava/lang/String;

    .prologue
    .line 50
    iput-object p1, p0, Lcom/disney/emagine/sdk/apple/NSError;->mDomain:Ljava/lang/String;

    .line 51
    return-void
.end method

.method public setUserInfo(Ljava/lang/String;)V
    .locals 0
    .param p1, "mUserInfo"    # Ljava/lang/String;

    .prologue
    .line 70
    iput-object p1, p0, Lcom/disney/emagine/sdk/apple/NSError;->mUserInfo:Ljava/lang/String;

    .line 71
    return-void
.end method

.method public userInfo()Ljava/lang/String;
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lcom/disney/emagine/sdk/apple/NSError;->mUserInfo:Ljava/lang/String;

    return-object v0
.end method
