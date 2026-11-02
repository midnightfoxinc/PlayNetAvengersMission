.class final enum Lcom/ning/http/client/multipart/MultipartBody$FileLocation;
.super Ljava/lang/Enum;
.source "MultipartBody.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/multipart/MultipartBody;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "FileLocation"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/ning/http/client/multipart/MultipartBody$FileLocation;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ning/http/client/multipart/MultipartBody$FileLocation;

.field public static final enum END:Lcom/ning/http/client/multipart/MultipartBody$FileLocation;

.field public static final enum MIDDLE:Lcom/ning/http/client/multipart/MultipartBody$FileLocation;

.field public static final enum NONE:Lcom/ning/http/client/multipart/MultipartBody$FileLocation;

.field public static final enum START:Lcom/ning/http/client/multipart/MultipartBody$FileLocation;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 48
    new-instance v0, Lcom/ning/http/client/multipart/MultipartBody$FileLocation;

    const-string v1, "NONE"

    invoke-direct {v0, v1, v2}, Lcom/ning/http/client/multipart/MultipartBody$FileLocation;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ning/http/client/multipart/MultipartBody$FileLocation;->NONE:Lcom/ning/http/client/multipart/MultipartBody$FileLocation;

    new-instance v0, Lcom/ning/http/client/multipart/MultipartBody$FileLocation;

    const-string v1, "START"

    invoke-direct {v0, v1, v3}, Lcom/ning/http/client/multipart/MultipartBody$FileLocation;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ning/http/client/multipart/MultipartBody$FileLocation;->START:Lcom/ning/http/client/multipart/MultipartBody$FileLocation;

    new-instance v0, Lcom/ning/http/client/multipart/MultipartBody$FileLocation;

    const-string v1, "MIDDLE"

    invoke-direct {v0, v1, v4}, Lcom/ning/http/client/multipart/MultipartBody$FileLocation;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ning/http/client/multipart/MultipartBody$FileLocation;->MIDDLE:Lcom/ning/http/client/multipart/MultipartBody$FileLocation;

    new-instance v0, Lcom/ning/http/client/multipart/MultipartBody$FileLocation;

    const-string v1, "END"

    invoke-direct {v0, v1, v5}, Lcom/ning/http/client/multipart/MultipartBody$FileLocation;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ning/http/client/multipart/MultipartBody$FileLocation;->END:Lcom/ning/http/client/multipart/MultipartBody$FileLocation;

    .line 47
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/ning/http/client/multipart/MultipartBody$FileLocation;

    sget-object v1, Lcom/ning/http/client/multipart/MultipartBody$FileLocation;->NONE:Lcom/ning/http/client/multipart/MultipartBody$FileLocation;

    aput-object v1, v0, v2

    sget-object v1, Lcom/ning/http/client/multipart/MultipartBody$FileLocation;->START:Lcom/ning/http/client/multipart/MultipartBody$FileLocation;

    aput-object v1, v0, v3

    sget-object v1, Lcom/ning/http/client/multipart/MultipartBody$FileLocation;->MIDDLE:Lcom/ning/http/client/multipart/MultipartBody$FileLocation;

    aput-object v1, v0, v4

    sget-object v1, Lcom/ning/http/client/multipart/MultipartBody$FileLocation;->END:Lcom/ning/http/client/multipart/MultipartBody$FileLocation;

    aput-object v1, v0, v5

    sput-object v0, Lcom/ning/http/client/multipart/MultipartBody$FileLocation;->$VALUES:[Lcom/ning/http/client/multipart/MultipartBody$FileLocation;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 47
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ning/http/client/multipart/MultipartBody$FileLocation;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 47
    const-class v0, Lcom/ning/http/client/multipart/MultipartBody$FileLocation;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/multipart/MultipartBody$FileLocation;

    return-object v0
.end method

.method public static values()[Lcom/ning/http/client/multipart/MultipartBody$FileLocation;
    .locals 1

    .prologue
    .line 47
    sget-object v0, Lcom/ning/http/client/multipart/MultipartBody$FileLocation;->$VALUES:[Lcom/ning/http/client/multipart/MultipartBody$FileLocation;

    invoke-virtual {v0}, [Lcom/ning/http/client/multipart/MultipartBody$FileLocation;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/ning/http/client/multipart/MultipartBody$FileLocation;

    return-object v0
.end method
