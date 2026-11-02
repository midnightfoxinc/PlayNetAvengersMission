.class public abstract enum Lcom/ning/http/util/QueryComputer;
.super Ljava/lang/Enum;
.source "QueryComputer.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/ning/http/util/QueryComputer;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ning/http/util/QueryComputer;

.field public static final enum URL_ENCODING_DISABLED_QUERY_COMPUTER:Lcom/ning/http/util/QueryComputer;

.field public static final enum URL_ENCODING_ENABLED_QUERY_COMPUTER:Lcom/ning/http/util/QueryComputer;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 24
    new-instance v0, Lcom/ning/http/util/QueryComputer$1;

    const-string v1, "URL_ENCODING_ENABLED_QUERY_COMPUTER"

    invoke-direct {v0, v1, v2}, Lcom/ning/http/util/QueryComputer$1;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ning/http/util/QueryComputer;->URL_ENCODING_ENABLED_QUERY_COMPUTER:Lcom/ning/http/util/QueryComputer;

    .line 57
    new-instance v0, Lcom/ning/http/util/QueryComputer$2;

    const-string v1, "URL_ENCODING_DISABLED_QUERY_COMPUTER"

    invoke-direct {v0, v1, v3}, Lcom/ning/http/util/QueryComputer$2;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ning/http/util/QueryComputer;->URL_ENCODING_DISABLED_QUERY_COMPUTER:Lcom/ning/http/util/QueryComputer;

    .line 22
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/ning/http/util/QueryComputer;

    sget-object v1, Lcom/ning/http/util/QueryComputer;->URL_ENCODING_ENABLED_QUERY_COMPUTER:Lcom/ning/http/util/QueryComputer;

    aput-object v1, v0, v2

    sget-object v1, Lcom/ning/http/util/QueryComputer;->URL_ENCODING_DISABLED_QUERY_COMPUTER:Lcom/ning/http/util/QueryComputer;

    aput-object v1, v0, v3

    sput-object v0, Lcom/ning/http/util/QueryComputer;->$VALUES:[Lcom/ning/http/util/QueryComputer;

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
    .line 22
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;ILcom/ning/http/util/QueryComputer$1;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # I
    .param p3, "x2"    # Lcom/ning/http/util/QueryComputer$1;

    .prologue
    .line 22
    invoke-direct {p0, p1, p2}, Lcom/ning/http/util/QueryComputer;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static queryComputer(Z)Lcom/ning/http/util/QueryComputer;
    .locals 1
    .param p0, "disableUrlEncoding"    # Z

    .prologue
    .line 95
    if-eqz p0, :cond_0

    sget-object v0, Lcom/ning/http/util/QueryComputer;->URL_ENCODING_DISABLED_QUERY_COMPUTER:Lcom/ning/http/util/QueryComputer;

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/ning/http/util/QueryComputer;->URL_ENCODING_ENABLED_QUERY_COMPUTER:Lcom/ning/http/util/QueryComputer;

    goto :goto_0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ning/http/util/QueryComputer;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 22
    const-class v0, Lcom/ning/http/util/QueryComputer;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/ning/http/util/QueryComputer;

    return-object v0
.end method

.method public static values()[Lcom/ning/http/util/QueryComputer;
    .locals 1

    .prologue
    .line 22
    sget-object v0, Lcom/ning/http/util/QueryComputer;->$VALUES:[Lcom/ning/http/util/QueryComputer;

    invoke-virtual {v0}, [Lcom/ning/http/util/QueryComputer;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/ning/http/util/QueryComputer;

    return-object v0
.end method

.method private final withQuery(Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;
    .locals 1
    .param p1, "query"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/Param;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 105
    .local p2, "queryParams":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/Param;>;"
    invoke-static {p2}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1, p2}, Lcom/ning/http/util/QueryComputer;->withQueryWithParams(Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0, p1}, Lcom/ning/http/util/QueryComputer;->withQueryWithoutParams(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private final withoutQuery(Ljava/util/List;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/Param;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 109
    .local p1, "queryParams":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/Param;>;"
    invoke-static {p1}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/ning/http/util/QueryComputer;->withoutQueryWithParams(Ljava/util/List;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public final computeFullQueryString(Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;
    .locals 1
    .param p1, "query"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/Param;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 113
    .local p2, "queryParams":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/Param;>;"
    invoke-static {p1}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, p1, p2}, Lcom/ning/http/util/QueryComputer;->withQuery(Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    invoke-direct {p0, p2}, Lcom/ning/http/util/QueryComputer;->withoutQuery(Ljava/util/List;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method protected abstract withQueryWithParams(Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/Param;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation
.end method

.method protected abstract withQueryWithoutParams(Ljava/lang/String;)Ljava/lang/String;
.end method

.method protected abstract withoutQueryWithParams(Ljava/util/List;)Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/Param;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation
.end method
