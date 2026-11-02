.class public final enum Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;
.super Ljava/lang/Enum;
.source "NSPropertyListSerialization.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disneymobile/mocha/NSPropertyListSerialization;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "NSPropertyListReadOptions"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;

.field public static final enum Default:Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 37
    new-instance v0, Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;

    const-string v1, "Default"

    invoke-direct {v0, v1, v2}, Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;->Default:Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;

    .line 36
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;

    sget-object v1, Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;->Default:Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;

    aput-object v1, v0, v2

    sput-object v0, Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;->$VALUES:[Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;

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
    .line 36
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 36
    const-class v0, Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;

    return-object v0
.end method

.method public static values()[Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;
    .locals 1

    .prologue
    .line 36
    sget-object v0, Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;->$VALUES:[Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;

    invoke-virtual {v0}, [Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;

    return-object v0
.end method
