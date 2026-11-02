.class public final enum Lcom/ning/http/client/AsyncHandler$STATE;
.super Ljava/lang/Enum;
.source "AsyncHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/AsyncHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "STATE"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/ning/http/client/AsyncHandler$STATE;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ning/http/client/AsyncHandler$STATE;

.field public static final enum ABORT:Lcom/ning/http/client/AsyncHandler$STATE;

.field public static final enum CONTINUE:Lcom/ning/http/client/AsyncHandler$STATE;

.field public static final enum UPGRADE:Lcom/ning/http/client/AsyncHandler$STATE;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 52
    new-instance v0, Lcom/ning/http/client/AsyncHandler$STATE;

    const-string v1, "ABORT"

    invoke-direct {v0, v1, v2}, Lcom/ning/http/client/AsyncHandler$STATE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ning/http/client/AsyncHandler$STATE;->ABORT:Lcom/ning/http/client/AsyncHandler$STATE;

    .line 56
    new-instance v0, Lcom/ning/http/client/AsyncHandler$STATE;

    const-string v1, "CONTINUE"

    invoke-direct {v0, v1, v3}, Lcom/ning/http/client/AsyncHandler$STATE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ning/http/client/AsyncHandler$STATE;->CONTINUE:Lcom/ning/http/client/AsyncHandler$STATE;

    .line 60
    new-instance v0, Lcom/ning/http/client/AsyncHandler$STATE;

    const-string v1, "UPGRADE"

    invoke-direct {v0, v1, v4}, Lcom/ning/http/client/AsyncHandler$STATE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ning/http/client/AsyncHandler$STATE;->UPGRADE:Lcom/ning/http/client/AsyncHandler$STATE;

    .line 47
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/ning/http/client/AsyncHandler$STATE;

    sget-object v1, Lcom/ning/http/client/AsyncHandler$STATE;->ABORT:Lcom/ning/http/client/AsyncHandler$STATE;

    aput-object v1, v0, v2

    sget-object v1, Lcom/ning/http/client/AsyncHandler$STATE;->CONTINUE:Lcom/ning/http/client/AsyncHandler$STATE;

    aput-object v1, v0, v3

    sget-object v1, Lcom/ning/http/client/AsyncHandler$STATE;->UPGRADE:Lcom/ning/http/client/AsyncHandler$STATE;

    aput-object v1, v0, v4

    sput-object v0, Lcom/ning/http/client/AsyncHandler$STATE;->$VALUES:[Lcom/ning/http/client/AsyncHandler$STATE;

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

.method public static valueOf(Ljava/lang/String;)Lcom/ning/http/client/AsyncHandler$STATE;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 47
    const-class v0, Lcom/ning/http/client/AsyncHandler$STATE;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/AsyncHandler$STATE;

    return-object v0
.end method

.method public static values()[Lcom/ning/http/client/AsyncHandler$STATE;
    .locals 1

    .prologue
    .line 47
    sget-object v0, Lcom/ning/http/client/AsyncHandler$STATE;->$VALUES:[Lcom/ning/http/client/AsyncHandler$STATE;

    invoke-virtual {v0}, [Lcom/ning/http/client/AsyncHandler$STATE;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/ning/http/client/AsyncHandler$STATE;

    return-object v0
.end method
